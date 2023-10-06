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
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        GeometryReader{ geometry in
            
            TabView {
                BlocksDisplay(blockStyles: $blockStyles, isShowingAlert: false, size: geometry.size).tabItem{
                    Label("Blocks", systemImage:"square.fill")
                }
                .accentColor(Color("Calories"))
                
                BlocksEdit(blockStyles: $blockStyles, blockSee: $oneStyle, size: geometry.size).tabItem{
                    Label("Edit Blocks", systemImage:"gearshape.fill")
                }
                .accentColor(Color("Calories"))
                
                FruitView(size: geometry.size).tabItem{
                    Label("Fruit List", systemImage:"leaf.fill")
                }
                .accentColor(Color("Calories"))
                
            }
            .accentColor(Color("AccentColor"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
