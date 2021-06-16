//
//  GoddessStore.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/16.
//

import SwiftUI
import Contentful
import Combine


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

class GoddessStore: ObservableObject {
    @Published var goddess: [Goddess] = []
    
    init() {
        getArray(id: "goddess") { items in
            items.forEach { item in
                self.goddess.append(Goddess(
                                        name: item.fields["name"] as! String,
                                        image: Image("Peter Paul Rubens_Diana cazadora"),
                                        headDescription: item.fields["headDescription"] as! String,
                                        description: item.fields["description"] as! String,
                                        footerImage: nil,
                                        fotterImageDescription: nil,
                                        type: Type(rawValue: item.fields["type"] as! String) ?? .olympus))
            }
        }
    }
}
