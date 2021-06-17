//
//  TabBar.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/17.
//

import SwiftUI

struct TabBar: View {
    init() {
        UITabBar.appearance().
       }
    
    var body: some View {
        
        TabView {
            
            NavigationView {
                HomeView()
                    .navigationTitle("Gaea")
            }
            
            .tabItem {
                Image(systemName: "house.fill").foregroundColor(.yellow)
                Text("Gaea")
            }
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

