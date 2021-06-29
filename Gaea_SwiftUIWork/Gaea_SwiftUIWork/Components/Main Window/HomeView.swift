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
    @State var scrollHeight = CGSize.zero
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    content
                        .navigationBarHidden(true)
                }.tabItem {
                    Image(systemName: "house.fill")
                    Text("Gaea")
                }
                
                NavigationView {
                    SearchView()
                        .navigationBarHidden(true)
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                
                
                NavigationView {
                    BookmarkView()
                        .navigationBarHidden(true)
                }
                .tabItem {
                    Image(systemName: "bookmark.circle")
                    Text("Bookmark")
                }
            }
            .accentColor(.primary.opacity(0.7))
            
            fullContent
        }
    }
    
    
    
    var content: some View {
        
        ZStack {
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
                                                .shadow(color: colorScheme == .light ? .black.opacity(0.25) : Color("NameYellow").opacity(0.25), radius: 15, x: 0.0, y: 10)

                                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                                .onTapGesture {
                                                    withAnimation(.spring(response: 0.7, dampingFraction: 0.7)) {
                                                        show.toggle()
                                                        selectedGoddess = item
                                                    }
                                                }
                                                .transition(.scale)
                                        }
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
                                                .shadow(color: colorScheme == .light ? .black.opacity(0.25) : Color("NameYellow").opacity(0.2), radius: 20, x: 0.0, y: 10)
                                                
                                                .onTapGesture {
                                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                                                        show.toggle()
                                                        selectedGoddess = item
                                                }
                                            }
                                                .transition(.opacity)
                                        }
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
                            .ignoresSafeArea()
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
    }
    
    @ViewBuilder
    var fullContent: some View {
        if let selectedGoddess = selectedGoddess {
            ZStack(alignment: .topTrailing){
                CardDetail(isSelected: $show, goddess: selectedGoddess, namespace: namespace, matchedGeometryEffectID: selectedGoddess.id)
                    

                CloseButton()
                    .padding(.trailing, 20)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                            self.show = false
                            self.selectedGoddess = nil
                    }
                }
            }
            .frame(width: screen.width)
            .zIndex(2)
            
            //.scaleEffect(1 - activeCard.height / 1000)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        HomeView(namespace: _namespace)
            .environmentObject(GoddessStore())
            .environment(\.colorScheme, .dark)
    }
}
