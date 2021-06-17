//
//  SearchView.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/16.
//

import SwiftUI

struct SearchView: View {
    @StateObject var store = GoddessStore()
    @State var isEditing = false
    
    var body: some View {
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
                        
                        
                        .onChange(of: store.searchText, perform: { text in
                            isEditing = true
                            
                            if isEditing {
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                    store.filterContent()
                                }
                            }
                    })
                }
            }
            .frame(height: 40)
            .background(RoundedRectangle(cornerRadius: 40.0, style: .continuous).stroke(lineWidth: 0.7).foregroundColor(.black.opacity(0.3)))
            .padding(.horizontal, 20)
            .padding(.bottom,12)
            
            Divider()
            
            ScrollView {
                ForEach(store.filteredGoddess) { goddess in
                    GoddessRow(goddess: goddess)
                        .padding(.horizontal, 30)
                }
            }
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
