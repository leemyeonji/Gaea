//
//  CardDetail.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI

struct CardDetail: View {
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                ZStack {
                    Image("Ceres_Hendrick Goltzius")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Demeter")
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
                    Text("Olympian goddess of the harvest and agriculture, presiding over grains and the fertility of the earth.")
                        .font(.system(size: 14, weight: .bold, design: .monospaced))
                        .multilineTextAlignment(.trailing)
                }
                .padding(.top, 9)
                .padding(.horizontal, 9)
                
                Divider()
                
                VStack(spacing: 30) {
                    Text("In ancient Greek religion and mythology, Demeter is the Olympian goddess of the harvest and agriculture, presiding over grains and the fertility of the earth. She was also called Deo. Her cult titles include Sito, 'she of the Grain', as the giver of food or grain, and Thesmophoros, 'giver of customs' and/or 'legislator', in association with the secret female-only festival called the Thesmophoria.")
                    
                    Text("Though Demeter is often described simply as the goddess of the harvest, she presided also over the sacred law, and the cycle of life and death. She and her daughter Persephone were the central figures of the Eleusinian Mysteries, a religious tradition that predated the Olympian pantheon, and which may have its roots in the Mycenaean period c. 1400–1200 BC.")
                    
                    Text("Demeter was often considered to be the same figure as the Anatolian goddess Cybele, and she was identified with the Roman goddess Ceres.")
                        
                }
                .font(.system(size: 16, weight: .light, design: .monospaced))
                .lineSpacing(8.0)
                .multilineTextAlignment(.leading)
                .padding(.all, 32)
            }
            
        }
        
        .ignoresSafeArea()
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail()
    }
}
