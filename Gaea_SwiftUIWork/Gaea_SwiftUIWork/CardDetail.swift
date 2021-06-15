//
//  CardDetail.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI

struct CardDetail: View {
    var body: some View {
        VStack {
            VStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Demeter")
                        .font(.custom("Dida", size: 44))
                        .foregroundColor(Color("NameYellow"))
                    Text("Olympian goddess of the harvest and agriculture, presiding over grains and the fertility of the earth.")
                        .font(.system(size: 13, weight: .light, design: .monospaced))
                }
                .padding(.all, 9)
                .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterial))
            }
            .background(
                Image("Ceres_Hendrick Goltzius")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
            .shadow(color: .black.opacity(0.25), radius: 20, x: 0.0, y: 10)
            
            
            Spacer()
        }
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail()
    }
}
