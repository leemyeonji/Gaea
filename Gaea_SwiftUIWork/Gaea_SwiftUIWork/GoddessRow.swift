//
//  GoddessRow.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/17.
//

import SwiftUI

struct GoddessRow: View {
    var goddess: Goddess
    //GoddessStore.init().goddess.first!
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image("GoddessIcon")
                
                VStack(alignment:.leading, spacing: 7) {
                    Text(goddess.name)
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                    Text(goddess.headDescription)
                        .font(.system(size: 13, weight: .light, design: .monospaced))
                        .lineLimit(2)
                        .lineSpacing(18)
                }
            }
            .padding(.vertical, 15)
            Divider()
        }
    }
}


