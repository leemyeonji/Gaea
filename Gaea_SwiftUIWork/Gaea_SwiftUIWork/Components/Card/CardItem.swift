//
//  Card.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI
import SDWebImageSwiftUI

/* struct Card: View {
    
    @State var show: Bool = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            if show == false {
                CardItem()
            } else {
                ScrollView {
                    VStack(alignment: .center) {
                        ZStack {
                            
                            goddess[0].image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .matchedGeometryEffect(id: "image", in: namespace, isSource: show)
                            
                            VStack(alignment: .center) {
                                Spacer()
                                Text(goddess[0].name)
                                    .font(.custom("Dida", size: 60))
                                    .foregroundColor(Color("NameYellow"))
                                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 10)
                                    .matchedGeometryEffect(id: "name", in: namespace, isSource: show)
                            }
                            .padding(.all, 9)
                            .padding(.bottom, 9)
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: screen.width, maxHeight: 620, alignment: .center)
                        .mask(RoundedRectangle(cornerRadius: 0, style: .continuous)
                                .matchedGeometryEffect(id: "mask", in: namespace))
                        .shadow(color: .black.opacity(0.25), radius: 20, x: 0.0, y: 10)
                        .edgesIgnoringSafeArea(.all)
                        
                        
                        HStack(spacing: 14) {
                            Image(systemName: "bookmark")
                                .font(.system(size: 24))
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 24))
                            Text(goddess[0].headDescription)
                                .font(.system(size: 14, weight: .bold, design: .monospaced))
                                .multilineTextAlignment(.trailing)
                                .matchedGeometryEffect(id: "headDescription", in: namespace)
                        }
                        .padding(.top, 9)
                        .padding(.horizontal, 9)
                        
                        Divider()
                        
                        VStack(spacing: 30) {
                            Text(goddess[0].description)
                                
                        }
                        .font(.system(size: 16, weight: .light, design: .monospaced))
                        .lineSpacing(8.0)
                        .multilineTextAlignment(.leading)
                        .padding(.all, 32)
                        
                        VStack {
                            goddess[0].footerImage?
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 600)
                            Text(goddess[0].fotterImageDescription ?? "")
                                .font(.system(size: 13, weight: .medium, design: .monospaced))
                                .padding(.top, 10)
                                .padding(.bottom, 50)
                        }
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}
 */



struct CardItem: View {
    
    var goddessItem: Goddess
    var cornerRadius: CGFloat = 22
    var alignment: HorizontalAlignment = .leading
    var fontSize: CGFloat = 44
    var imageWidth: CGFloat = 300
    var imageHight: CGFloat = 420
    var blurViewOpacity: Double = 0.8
    var headTextOpacity: Double = 1
    var nameAlignment: VerticalAlignment = .top
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(alignment: nameAlignment) {
                VStack(alignment: alignment) {
                    Text(goddessItem.name)
                        .font(.custom("Dida", size: fontSize))
                        .foregroundColor(Color("NameYellow"))
                        
                    
                    Text(goddessItem.headDescription)
                        .font(.system(size: 13, weight: .light, design: .monospaced))
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .opacity(headTextOpacity)
                }
                .padding(.all, 9)
                .frame(maxWidth: .infinity, maxHeight: 150)
                .frame(height: 110)
                .background(
                    VisualEffectBlur(blurStyle: .systemUltraThinMaterial)
                        .opacity(blurViewOpacity)
                )
                .clipped()
            }
        }
        
        .background(
            WebImage(url: goddessItem.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageWidth, height: imageHight)
                
        )
        .frame(width: imageWidth, height: imageHight)
        .mask(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .shadow(color: .black.opacity(0.25), radius: 20, x: 0.0, y: 10)
    }
}

struct Card_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CardItem(goddessItem: GoddessStore.init().goddess.first!)
    }
}
