//
//  Card.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI

struct Card: View {
    @Namespace var namespace
    var goddess: Goddess
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text(goddess.name)
                    .matchedGeometryEffect(id: "Name", in: namespace)
                    .font(.custom("Dida", size: 44))
                    .foregroundColor(Color("NameYellow"))
                    
                Text(goddess.headDescription)
                    .font(.system(size: 13, weight: .light, design: .monospaced))
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
            .frame(maxWidth: .infinity, maxHeight: 150)
            .frame(height: 110)
            .padding(.all, 9)
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterial))
        }
        
        .background(
            goddess.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "Image", in: namespace)
        )
        .mask(RoundedRectangle(cornerRadius: 22.0, style: .continuous))
        .shadow(color: .black.opacity(0.25), radius: 20, x: 0.0, y: 10)
    }
}



struct Card_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        Card(goddess: goddess[2])
    }
}
