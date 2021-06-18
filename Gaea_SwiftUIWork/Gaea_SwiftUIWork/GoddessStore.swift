//
//  GoddessStore.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/16.
//

import SwiftUI
import Contentful
import Combine


class GoddessStore: ObservableObject {
    @Published var goddess: [Goddess] = []
    @Published var filteredGoddess: [Goddess] = []
    @Published var searchText = ""
    
    let client = Client(spaceId: "rhw260px4j41", accessToken: "_TYVwcwUrPEIN2kUoCpxQiIF5a3sa56JsFnzVdgEBL0")

    func getArray(id: String, completion: @escaping ([Entry]) -> ()) {
        let query = Query.where(contentTypeId: id)
        
        client.fetchArray(of: Entry.self, matching: query) { result in
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async {
                        completion(data.items)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    init() {
        getArray(id: "goddess") { items in
            items.forEach { item in
                self.goddess.append(Goddess(
                                        name: item.fields["name"] as? String ?? "",
                                        image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
                                        headDescription: item.fields["headDescription"] as? String ?? "",
                                        description: item.fields["description"] as? String ?? "",
                                        footerImage: item.fields.linkedAsset(at: "footerImage")?.url ?? nil,
                                        fotterImageDescription: item.fields["fotterImageDescription"] as? String ?? nil,
                                        type: Type(rawValue: item.fields["type"] as! String) ?? .olympus))
            }
            print(self.goddess)
        }
    }
    
    func filterContent() {
        let lowercasedSearchText = searchText.lowercased()
        
        if searchText.count != 0 {
            var matchingGoddess: [Goddess] = []
            
            self.goddess.forEach { goddess in
                let searchContent = goddess.name + goddess.description + goddess.headDescription
                if searchContent.lowercased().contains(lowercasedSearchText) {
                    matchingGoddess.append(goddess)
                }
            }
            self.filteredGoddess = matchingGoddess
        } else {
            filteredGoddess = []
        }
    }
}
