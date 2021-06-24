//
//  TabBar.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/17.
//

import SwiftUI

struct TabBar: View {
    
    var body: some View {
        
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Gaea")
            }
            
            
            NavigationView {
                SearchView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            
            
            NavigationView {
                BookmarkView()
            }
            .tabItem {
                Image(systemName: "bookmark.circle")
                Text("Bookmark")
            }
        }
        
        .accentColor(.black.opacity(0.8))
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(GoddessStore())
    }
}

