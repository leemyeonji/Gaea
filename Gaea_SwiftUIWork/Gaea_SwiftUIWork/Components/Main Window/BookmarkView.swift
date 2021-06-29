//
//  Home.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/17.
//

import SwiftUI

struct BookmarkView: View {
    @EnvironmentObject var store: GoddessStore
    @Namespace var namespace2
    @State var isSelected: Bool = false
    @State var selectedGoddess: Goddess?
    @Environment(\.colorScheme) var colorScheme
    
    var bookmarkedGoddess: [Goddess] {
        store.bookmarkedGoddessID.map {
            Goddess(for: $0, goddessItems: store.goddess) ?? store.goddess.first!
        }
    }
    
    var body: some View {
        ZStack {
            content
            fullContent
            
        }
        .navigationBarHidden(true)
    }
    
    var content: some View {
        ZStack {
            VStack {
                Text("Bookmark")
                    .font(.system(size:  34, weight: .heavy, design: .monospaced))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 27)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.2)
                
                Spacer()
                
                ZStack {
                    ScrollView {
                        LazyVGrid (columns: [GridItem(.adaptive(minimum: 150),spacing: 12)], spacing: 20) {
                            ForEach(bookmarkedGoddess) { item in
                                CardItem(goddessItem: item,
                                         cornerRadius: 12.0,
                                         alignment: .center,
                                         fontSize: 26.0,
                                         imageWidth: 160,
                                         imageHight: 230,
                                         blurViewOpacity: 0,
                                         headTextOpacity: 0,
                                         nameAlignment: .lastTextBaseline,
                                         nameOffset: 50
                                )
                                .matchedGeometryEffect(id: item.id + "\(1)", in: namespace2, isSource: !isSelected)
                                .shadow(color: colorScheme == .light ? .black.opacity(0.25) : Color("NameYellow").opacity(0.25), radius: 15, x: 0.0, y: 10)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0)) {
                                        isSelected.toggle()
                                        selectedGoddess = item
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    
                }
            }
            .onAppear() {
                PersistenceManager.retrieveBookmarks { result in
                    switch result {
                    case .success(let goddessID):
                        store.bookmarkedGoddessID = goddessID
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
        .zIndex(1)
    }
    
    @ViewBuilder
    var fullContent: some View {
        if selectedGoddess != nil && isSelected {
            ZStack(alignment: .topTrailing) {
                CardDetail(isSelected: $isSelected, goddess: selectedGoddess!, namespace: namespace2, matchedGeometryEffectID: selectedGoddess!.id + "\(1)")
                    
                CloseButton()
                    .padding(.trailing, 24)
                    .onTapGesture {
                        self.isSelected = false
                        self.selectedGoddess = nil
                    }
            }
            .zIndex(2)
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        BookmarkView()
            .environmentObject(GoddessStore())
    }
}
