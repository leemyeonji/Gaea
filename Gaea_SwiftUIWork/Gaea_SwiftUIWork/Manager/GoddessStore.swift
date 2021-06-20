//
//  GoddessStore.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/16.
//
import Foundation
import SwiftUI
import Contentful
import Combine


class GoddessStore: ObservableObject {
    @Published var goddess: [Goddess] = []
    @Published var filteredGoddess: [Goddess] = []
    @Published var searchText = ""
    @Published var bookmarkedGoddessID = Set<Goddess.ID>() {
        didSet {
            PersistenceManager.saveBookmarks(bookmarks: bookmarkedGoddessID)
        }
        
    }
    
    
    
    
    
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
                self.goddess.append(Goddess(id: item.fields["id"] as? String ?? "",
                                            name: item.fields["name"] as? String ?? "",
                                            image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
                                            headDescription: item.fields["headDescription"] as? String ?? "",
                                            description: item.fields["description"] as? String ?? "",
                                            footerImage: item.fields.linkedAsset(at: "footerImage")?.url ?? nil,
                                            fotterImageDescription: item.fields["fotterImageDescription"] as? String ?? nil,
                                            type: Type(rawValue: item.fields["type"] as! String) ?? .olympus))
            }
        }
    }
    
    
    func filterContent() {
        let lowercasedSearchText = searchText.lowercased()
        
        if searchText.count > 0 {
            var matchingGoddess: [Goddess] = []
            
            self.goddess.forEach { goddess in
                let searchContent = goddess.name + goddess.description + goddess.headDescription
                if searchContent.lowercased().range(of: lowercasedSearchText, options: .literal) != nil {
                    matchingGoddess.append(goddess)
                }
            }
            self.filteredGoddess = matchingGoddess
            
        } else {
            filteredGoddess = goddess
        }
    }
    
    
    
    
    
/*    func retrieveBookmarks(completion: @escaping (Result<[Goddess], Error>) -> Void) {
        guard let bookmarkData = UserDefaults.standard.object(forKey: saveKey) as? Data else {
            completion(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let bookmarks = try decoder.decode([Goddess].self, from: bookmarkData)
            completion(.success(bookmarks))
        } catch {
            completion(.failure(error))
        }
    }
    
    
    func saveBookmarks(bookmarks: Goddess) -> Error? {
        do {
            let encoder = JSONEncoder()
            let encodedBookmarks = try encoder.encode(bookmarks)
            UserDefaults.standard.set(encodedBookmarks, forKey: saveKey)
            return nil
        } catch {
            return error
        }
    }
    
    
    func updateBookmarksWith(bookmark: Goddess, actionType: RetreiveAction, completion: @escaping (GoddessError?) -> Void) {
        retrieveBookmarks { result in
            switch result {
            case .success(let goddess):
                var retrievedGoddess = goddess
                
                switch actionType {
                case .add:
                    guard !retrievedGoddess.contains(bookmark) else {
                        completion(.alreadyInBookmarks)
                        return
                    }
                    retrievedGoddess.append(bookmark)
                    
                    
                case .remove:
                    retrievedGoddess.removeAll { $0.id == bookmark.id }
                }
                
                
            case .failure:
                completion(.somethingWentWrong)
            }
        }
    } */
}




enum GoddessError: String, Error {
    case alreadyInBookmarks = "You've already bookmarked this Goddess."
    case somethingWentWrong = "Something went wrong."
    case cannotSave = "야 저장 실패다"
}





extension GoddessStore {
    func toggleBookmark(goddess: Goddess) {
        if bookmarkedGoddessID.contains(goddess.id) {
            bookmarkedGoddessID.remove(goddess.id)
        } else {
            bookmarkedGoddessID.insert(goddess.id)
            
//            let url = getDocumentsDirectory().appendingPathComponent("Bookmarked").appendingPathExtension("plist")
//            do {
//                let encoder = JSONEncoder()
//                let encodedBookmark = try encoder.encode(goddess.id)
//                try encodedBookmark.write(to: url)
//
//                print(encodedBookmark)
//            } catch {
//                print(error.localizedDescription)
//            }
        }
    }
    
    func isBookmarked(goddess: Goddess) -> Bool {
        bookmarkedGoddessID.contains(goddess.id)
    }
}

