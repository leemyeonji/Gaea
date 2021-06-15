//
//  ContentView.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI

struct HomeView: View {
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
                    
                    
                    Text("Olympus")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 27)
                        .padding(.top, 22)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            Card()
                                .frame(width: 300, height: 420)
                        }
                        .padding(.leading, 27)
                        .padding(.bottom, 60)
                        
                   
                        
                    }
                    
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
