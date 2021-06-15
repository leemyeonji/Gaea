//
//  Card.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI

struct Card: View {
    
    @State var show = false
    
    var namespace: Namespace.ID
    
    var body: some View {
        ZStack {
            if show == false {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(goddess) { goddess in
                            CardItem(show: $show, goddess: goddess)
                        }
                    }
                }
            } else {
                
                ZStack {
                    CardDetail(goddess: goddess[0], namespace: namespace)
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 36))
                                .opacity(0.8)
                                .offset(x: -16, y: 16)
                                .animation(.easeIn)
                                .onTapGesture {
                                    show = false
                                }
                            Spacer()
                        }
                    }
                }
                .frame(maxWidth: screen.width, maxHeight: screen.height)

            }
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                show.toggle()
            }
        }
        .ignoresSafeArea()
    }
}



struct Card_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        Card(namespace: namespace)
    }
}

struct CardItem: View {
    @Binding var show: Bool
    var goddess: Goddess
    @Namespace var namespace
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text(goddess.name)
                    .matchedGeometryEffect(id: "name", in: namespace)
                    .font(.custom("Dida", size: 44))
                    .foregroundColor(Color("NameYellow"))
                
                Text(goddess.headDescription)
                    .matchedGeometryEffect(id: "headDescription", in: namespace)
                    .font(.system(size: 13, weight: .light, design: .monospaced))
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 150)
            .frame(height: 110)
            .padding(.all, 9)
            .background(
                VisualEffectBlur(blurStyle: .systemUltraThinMaterial)
                    .opacity(show ? 0 : 0.8)
            )
        }
        .frame(width: 300, height: 420)
        .background(
            goddess.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .mask(RoundedRectangle(cornerRadius: 22.0, style: .continuous))
        .shadow(color: .black.opacity(0.25), radius: 20, x: 0.0, y: 10)
    }
}
