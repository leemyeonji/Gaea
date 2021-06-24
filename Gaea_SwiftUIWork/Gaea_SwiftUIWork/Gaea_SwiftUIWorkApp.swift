//
//  Gaea_SwiftUIWorkApp.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI

@main
struct Gaea_SwiftUIWorkApp: App {

    var goddessVM = GoddessStore()
    var namespace: Namespace.ID?
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(GoddessStore())
        }
    }
}
