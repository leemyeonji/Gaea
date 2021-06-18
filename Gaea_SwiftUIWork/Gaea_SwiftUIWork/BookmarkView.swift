//
//  Home.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/17.
//

import SwiftUI

struct BookmarkView: View {
    @EnvironmentObject var store: GoddessStore
    var bookmarkedGoddess: [Goddess] {
        store.bookmarkedGoddessID.map{ Goddess(for: $0)!}
    }
    
    
    var body: some View {
        VStack {
            Text("Bookmark")
                .font(.system(size:  34, weight: .heavy, design: .monospaced))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 27)
                .padding(.top, 12)
                .padding(.bottom, 12)
            
            Rectangle()
                .frame(height: 1)
                .opacity(0.2)
            
            Spacer()
            
            LazyVGrid (columns: [GridItem(.adaptive(minimum: 180))], spacing: 14) {
                ForEach(bookmarkedGoddess) { item in
                    CardItem(goddessItem: item)
                }
            }
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
            .environmentObject(GoddessStore())
    }
}
