//
//  CardDetail.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardDetail: View {
    @EnvironmentObject var store: GoddessStore
    @Environment(\.presentationMode) var presentationMode
    @Binding var isSelected: Bool
    @State var shareToggle: Bool = false
    
    
    
    var goddess: Goddess
    var namespace: Namespace.ID
    var matchedGeometryEffectID: String
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                CardItem(goddessItem: goddess, cornerRadius: 0, alignment: .center, fontSize: 60, imageWidth: screen.width, imageHight: 600, blurViewOpacity: 0, headTextOpacity: 0)
                    .shadow(color: .black.opacity(0.25), radius: 20, x: 0.0, y: 10)
                    .matchedGeometryEffect(id: matchedGeometryEffectID, in: namespace, isSource: !isSelected)
                
                HStack(spacing: 14) {
                    BookmarkButton(goddess: goddess)
                    ShareButton(store: _store, goddess: goddess)
                    
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
                .lineLimit(.none)
                .multilineTextAlignment(.leading)
                .padding(.all, 32)
                
                VStack {
                    WebImage(url: goddess.footerImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        //.frame(height: 600)
                        
                    Text(goddess.fotterImageDescription ?? "")
                        .font(.system(size: 13, weight: .medium, design: .monospaced))
                        .padding(.top, 10)
                        .padding(.bottom, 50)
                }
            }
        }
        .background(Color("Background"))
        
        .ignoresSafeArea()
    }
}

let screen = UIScreen.main.bounds

//struct CardDetail_Previews: PreviewProvider {
//    @Namespace static var namespace
//    static var previews: some View {
//        Group {
//            CardDetail(goddess: goddess[0], namespace: namespace)
//
//        }
//    }
//}
