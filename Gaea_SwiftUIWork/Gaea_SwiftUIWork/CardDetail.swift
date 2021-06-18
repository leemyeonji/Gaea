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
    var goddess: Goddess
    var namespace: Namespace.ID
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                CardItem(goddessItem: goddess, cornerRadius: 0, alignment: .center, fontSize: 60, imageWidth: screen.width, imageHight: 600, blurViewOpacity: 0, headTextOpacity: 0)
                    .matchedGeometryEffect(id: goddess.id, in: namespace)
                
                HStack(spacing: 14) {
                    Image(systemName: "bookmark")
                        .font(.system(size: 24))
                        .onTapGesture {
                            store.saveBookmarks(bookmarks: goddess)
                            store.updateBookmarksWith(bookmark: goddess, actionType: .add) { error in
                                guard let _ = error else {
                                    print(goddess)
                                    return
                                }
                                print(GoddessError.alreadyInBookmarks)
                            }
                        }
                    
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
                    WebImage(url: goddess.footerImage)
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
        .matchedGeometryEffect(id: "container\(goddess.id)", in: namespace)
        
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
