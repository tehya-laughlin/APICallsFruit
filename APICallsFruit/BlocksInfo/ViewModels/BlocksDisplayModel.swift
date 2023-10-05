//
//  BlocksDisplay.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 10/5/23.
//

import Foundation
import SwiftUI

struct BlocksDisplay: View {
    
    @Binding var blockStyles: [BlockStyle]
    @State var isShowingAlert: Bool
    
    var body: some View {
        NavigationView{
            VStack {
                
                Button("Clear All Blocks") {
                    isShowingAlert = true
                }.alert("Are you sure you want to clear your blocks?", isPresented: $isShowingAlert){
                    Button("OK", role: .none) {
                        blockStyles = []
                    }
                    Button("Cancel", role: .cancel) {}
                }
                .padding(.top, 30)
                
                ScrollView{
                    VStack {
                        ForEach($blockStyles){ BlockStyle in
                            Squares(radii: BlockStyle.radii, color: BlockStyle.color)
                        }
                    }
                }
                .frame(height: 500)
                .padding(.top, 30)
            }.navigationTitle("Blocks")
        }
    }
}
