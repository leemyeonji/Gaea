//
//  ShareButton.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ShareButton: View {
    @EnvironmentObject var store: GoddessStore
    var goddess: Goddess?
    
    var body: some View {
        
        Button(action: {
            shareButton()
        }, label: {
            Image(systemName: "square.and.arrow.up")
                .font(.system(size: 24))
        })
    }
    
    func shareButton() {
        let webImage = WebImage(url: self.goddess?.image)
            let activityController = UIActivityViewController(activityItems: [webImage], applicationActivities: nil)

            UIApplication.shared.windows.first!.rootViewController!.present(activityController, animated: true)
    }
}


