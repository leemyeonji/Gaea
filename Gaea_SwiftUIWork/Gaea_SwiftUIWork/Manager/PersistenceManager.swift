//
//  PersistenceManager.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/20.
//

import Foundation

enum RetreiveAction {
    case add, remove
}


enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    static let saveKey = "Bookmark"
    
    
    static func retrieveBookmarks(completion: @escaping (Result<Set<Goddess.ID>, GoddessError>) -> Void) {
        guard let bookmarkData = defaults.object(forKey: "Bookmark") as? Data else {
            completion(.failure(.alreadyInBookmarks))
            return
        }
        do {
           let decoder = JSONDecoder()
           let bookmarks = try decoder.decode(Set<Goddess.ID>.self, from: bookmarkData)
            completion(.success(bookmarks))
        } catch {
            completion(.failure(.somethingWentWrong))
        }
    }
    
    
    static func saveBookmarks(bookmarks: Set<Goddess.ID>) -> GoddessError? {
        do {
            let encoder = JSONEncoder()
            let encodedBookmarks = try encoder.encode(bookmarks)
            defaults.set(encodedBookmarks, forKey: saveKey)
            return nil
        } catch {
            return .cannotSave
        }
    }
    
    

}
