//
//  BookmarkButton.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/18.
//

import SwiftUI

struct BookmarkButton: View {
    @EnvironmentObject var store: GoddessStore
    var goddess: Goddess?
    var isBookmarked: Bool {
        guard let goddess = goddess else { return false }
        return store.bookmarkedGoddessID.contains(goddess.id)
    }
    
    var body: some View {
        Button(action: toggleBookmark) {
            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                .font(.system(size: 24))  
        }
    }
    
    func toggleBookmark() {
        guard let goddess = goddess else { return }
        store.toggleBookmark(goddess: goddess)
        print(store.bookmarkedGoddessID)
    }
}

struct BookmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkButton()
            .environmentObject(GoddessStore())
    }
}
