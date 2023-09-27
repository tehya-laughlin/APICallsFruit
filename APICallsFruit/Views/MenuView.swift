//
//  MenuView.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 9/27/23.
//

import SwiftUI

struct MenuView: View {
    @Binding var isFiltered: Bool
    
    var body: some View {
        Menu {
                Button("Filter by family, order, or genus"){
                    isFiltered = true
                }
                Button("Filter by name"){
                    isFiltered = false
                }
                
        } label: {
            Label("Filters", systemImage: "menucard.fill")
                .foregroundColor(Color("Title"))
        }
    }
}


