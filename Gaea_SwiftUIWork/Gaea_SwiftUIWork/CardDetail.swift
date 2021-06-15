//
//  CardDetail.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI

struct CardDetail: View {
    var goddess: Goddess
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                ZStack {
                    goddess.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(goddess.name)
                            .font(.custom("Dida", size: 60))
                            .foregroundColor(Color("NameYellow"))
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 10)
                    }
                    .padding(.all, 9)
                    .padding(.bottom, 9)
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: 620)
                .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
                .shadow(color: .black.opacity(0.25), radius: 20, x: 0.0, y: 10)
                .edgesIgnoringSafeArea(.all)
                
                
                HStack(spacing: 14) {
                    Image(systemName: "bookmark")
                        .font(.system(size: 24))
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 24))
                    Text(goddess.headDescription)
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .multilineTextAlignment(.trailing)
                }
                .padding(.top, 9)
                .padding(.horizontal, 9)
                
                Divider()
                
                VStack(spacing: 30) {
                    Text(goddess.description)
                        
                }
                .font(.system(size: 16, weight: .light, design: .monospaced))
                .lineSpacing(8.0)
                .multilineTextAlignment(.leading)
                .padding(.all, 32)
                
                VStack {
                    goddess.footerImage?
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 600)
                    Text(goddess.fotterImageDescription ?? "")
                        .font(.system(size: 13, weight: .medium, design: .monospaced))
                        .padding(.top, 10)
                        .padding(.bottom, 50)
                }
            }
        }
        
        .ignoresSafeArea()
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(goddess: goddess[0])
    }
}
