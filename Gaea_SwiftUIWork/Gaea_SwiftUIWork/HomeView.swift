//
//  ContentView.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI

struct HomeView: View {
    @State var show = false
    var namespace: Namespace.ID
    
    var body: some View {
        if show == false {
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
                        

                        ZStack(alignment: .top) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 30) {
                                    ForEach(goddess.filter {
                                        $0.type == .olympus
                                    }.indices) { index in
                                        Card(goddess: goddess[index])
                                            .frame(maxWidth: 300)
                                            .frame(height: 420)
                                            .animation(.spring())
                                            .onTapGesture {
                                                show.toggle()
                                        }
                                            
                                    }
                                    
                                }
                                .padding(.horizontal, 27)
                                .padding(.bottom, 60)
                                .padding(.top, 60)
                            }
                            
                            Text("Olympus")
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 27)
                                .padding(.top, 22)
                        }
                    }
                }
            }
        } else {
            ZStack {
                CardDetail(namespace: namespace, goddess: goddess[0])
                
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "xmark.octagon.fill")
                            .font(.system(size: 36))
                            .opacity(0.8)
                            .offset(x: -16)
                            .animation(.easeIn)
                            .onTapGesture {
                                show = false
                            }
                        Spacer()
                    }
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        HomeView(namespace: namespace)
    }
}
