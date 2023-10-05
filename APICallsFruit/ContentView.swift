//
//  ContentView.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 9/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var blockStyles: [BlockStyle] = []
    @State var oneStyle: BlockStyle = BlockStyle(radii: [0,0,0,0,0], color: Color.blue)
    
    var body: some View {
        GeometryReader{ geometry in
            
            TabView {
                BlocksDisplay(blockStyles: $blockStyles, isShowingAlert: false).tabItem{
                    Label("Blocks", systemImage:"house")
                }
                BlocksEdit(blockStyles: $blockStyles, blockSee: $oneStyle).tabItem{
                    Label("Edit Blocks", systemImage:"gear")
                }
                FruitListView(size: geometry.size).tabItem{
                    Label("Fruit", systemImage: "gear")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
