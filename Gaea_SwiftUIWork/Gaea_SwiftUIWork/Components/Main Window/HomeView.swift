//
//  ContentView.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI


struct HomeView: View {
    @ObservedObject var store = GoddessStore()
    @State var show: Bool = false
    @Namespace var namespace
    @State var selectedGoddess: Goddess? = nil
    
    var body: some View {
        ZStack {
            content
            fullContent
        }
        .navigationBarHidden(true)
    }
    
    var content: some View {
        
        ScrollView(.vertical) {
            
            ZStack {
                VStack {
                        Text("Gaea")
                            .font(.system(size:  34, weight: .heavy, design: .monospaced))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 27)
                            .padding(.top, 12)
                            .padding(.bottom, 12)

                        Rectangle()
                            .frame(height: 1)
                            .opacity(0.2)
                        
                        
                        VStack {
                            Text("Olympus")
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 27)
                                .padding(.top, 34)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 30) {
                                    ForEach(store.goddess.filter {
                                        $0.type == .olympus
                                    }) { item in
                                        HStack {
                                            CardItem(goddessItem: item)
                                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                                .transition(.identity)
                                                .onTapGesture {
                                                    withAnimation(.spring(response: 0.7, dampingFraction: 0.7)) {
                                                        show.toggle()
                                                        selectedGoddess = item
                                                    }
                                                }
                                        }
                                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                                    }
                                }
                                .padding(.horizontal, 27)
                                .padding(.top, 30)
                                .padding(.bottom, 50)
                            }
                            
                            .offset(y: -28)
                        }
                        
                        
                        
                        VStack {
                            
                                Text("Others")
                                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 27)
                                    
                              
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 30) {
                                    ForEach(store.goddess.filter {
                                        $0.type == .other
                                    }) { item in
                                        HStack {
                                            CardItem(goddessItem: item)
                                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                                .transition(.identity)
                                                .onTapGesture {
                                                    withAnimation(.spring(response: 0.7, dampingFraction: 0.7)) {
                                                        show.toggle()
                                                        selectedGoddess = item
                                                    }
                                                }
                                        }
                                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                                    }
                                }
                                .padding(.horizontal, 27)
                                .padding(.top, 30)
                                .padding(.bottom, 50)
                            }
                            .offset(y: -28)
                        }
                        
                        .offset(y: -30)
                        
                        
                        
                        
                        Image("Artemis of Ephesians")
                            .blur(radius: 6)
                            .overlay(Rectangle()
                                        .foregroundColor(.black.opacity(0.6))
                            )
                            .overlay(
                                VStack(alignment: .leading, spacing: 26) {
                                    Text("Archaeological materials are not mute. They speak their own language. And they need to be used for the great source they are to help unravel the spirituality of those of our ancestors who predate the Indo-Europeans by many thousands of years.")
                                        .font(.system(size: 18, weight: .light, design: .monospaced))
                                    Text("Marija Gimbutienė")
                                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                                    HStack(spacing: 14) {
                                        Link(destination: URL(string: "https://en.wikipedia.org/wiki/Marija_Gimbutas")!) {
                                            Image(systemName: "link")
                                        }
                                        Link(destination: URL(string: "https://www.youtube.com/watch?v=-k34hXty4iw")!) {
                                            Image(systemName: "play.rectangle.fill")
                                        }
                                        
                                        //
                                    }
                                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 60)
                            )
                            
                }
                .frame(maxWidth: screen.width)
            }
            .zIndex(1)
        }
        
    }
    
    @ViewBuilder
    var fullContent: some View {
        if let selectedGoddess = selectedGoddess {
            ZStack(alignment: .topTrailing){
                CardDetail(isSelected: $show, goddess: selectedGoddess, namespace: namespace)
                    
                CloseButton()
                    .padding(.trailing, 20)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                            self.show = false
                            self.selectedGoddess = nil
                        }
                    }
                    .transition(.scale)
            }
            .frame(width: screen.width)
            .zIndex(2)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        HomeView(namespace: _namespace)
    }
}
