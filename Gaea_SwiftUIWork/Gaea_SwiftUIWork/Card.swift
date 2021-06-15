//
//  Card.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI

struct Card: View {
    var goddess: Goddess
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text(goddess.name)
                    .font(.custom("Dida", size: 44))
                    .foregroundColor(Color("NameYellow"))
                Text(goddess.headDescription)
                    .font(.system(size: 13, weight: .light, design: .monospaced))
            }
            .padding(.all, 9)
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterial))
        }
        .background(
            goddess.image
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .clipShape(RoundedRectangle(cornerRadius: 22.0, style: .continuous))
        .shadow(color: .black.opacity(0.25), radius: 20, x: 0.0, y: 10)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(goddess: goddess[0])
    }
}
