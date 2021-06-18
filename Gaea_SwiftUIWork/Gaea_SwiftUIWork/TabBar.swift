//
//  TabBar.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/17.
//

import SwiftUI

struct TabBar: View {
    init() {
        UITabBar.appearance().tintColor = .systemGray2
       }
    
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
            
            
        }
        
        .accentColor(.black.opacity(0.8))
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

