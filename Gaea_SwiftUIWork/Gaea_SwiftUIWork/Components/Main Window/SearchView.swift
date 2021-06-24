//
//  SearchView.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/16.
//

import SwiftUI

struct SearchView: View {
    @StateObject var store = GoddessStore()
    @State var isSelected = false
    @State var selectedGoddess: Goddess? = nil
    @Namespace var namespace3
    
    var body: some View {
        ZStack {
            content
            fullcontent
        }
        .navigationBarHidden(true)
    }
    
    var content: some View {
        ZStack {
            VStack {
                Text("Search")
                    .font(.system(size:  34, weight: .heavy, design: .monospaced))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 27)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.leading)
                        
                        TextField("Search Goddess", text: $store.searchText)
                            .keyboardType(.default)
                            .foregroundColor(Color.black)
                            .font(.system(size: 15, weight: .medium, design: .monospaced))
                            .onChange(of: store.searchText){ text in
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                    store.filterContent()
                            }
                        }
                    }
                }
                .frame(height: 40)
                .background(RoundedRectangle(cornerRadius: 40.0, style: .continuous).stroke(lineWidth: 0.7).foregroundColor(.black.opacity(0.3)))
                .padding(.horizontal, 20)
                .padding(.bottom,12)
                
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.2)
                
                ScrollView {
                    ForEach(store.searchText.count > 0 ? store.filteredGoddess : store.goddess.sorted()) { goddess in
                            GoddessRow(goddess: goddess)
                                .padding(.horizontal, 30)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                                        isSelected = true
                                        selectedGoddess = goddess
                            }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var fullcontent: some View {
        if selectedGoddess != nil && isSelected == true {
            ZStack(alignment: .topTrailing) {
                CardDetail(isSelected: $isSelected, goddess: selectedGoddess!, namespace: namespace3)
                    .matchedGeometryEffect(id: "card", in: namespace3)
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

struct SearchView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        SearchView()
    }
}
