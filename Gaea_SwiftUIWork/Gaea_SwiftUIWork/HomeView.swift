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

                        //olympusGoddess
                        
                        //otherGoddess
                        ZStack {
                            Card(show: $show, goddess: goddess[0])
                        }
                        //.offset(show ? CGPoint(-200.0) : 0)
                        .zIndex(0)
                        .ignoresSafeArea()
                        
                        
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
                                    Image(systemName: "play.rectangle.fill")
                                    Image(systemName: "link")
                                }
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 60)
                        )
                        .padding(.top, 40)
                    
                }
            }
        }
    }
    
    var olympusGoddess: some View {
        ZStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(goddess.filter {
                        $0.type == .olympus
                    }.indices) { index in
                        Card(show: $show, goddess: goddess[index])
                            
                            .frame(maxWidth: 300)
                            .frame(height: 420)
                            
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
    
    var otherGoddess: some View {
        ZStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(goddess.filter {$0.type == .other}.indices) { index in
                        Card(show: $show, goddess: goddess.filter {$0.type == .other}[index])
                            .frame(maxWidth: 360)
                            .frame(height: 480)
                            
                            .onTapGesture {
                                show.toggle()
                        }
                    }
                }
                .padding(.horizontal, 27)
                .padding(.bottom, 60)
                .padding(.top, 38)
            }
            
            Text("Others")
                .font(.system(size: 20, weight: .bold, design: .monospaced))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 27)
                
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        HomeView(namespace: namespace)
    }
}
