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
    
    var notification = PushNotificationService()
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        GeometryReader{ geometry in
            
            TabView {
                BlocksDisplay(blockStyles: $blockStyles, isShowingAlert: false, size: geometry.size, notifications: notification).tabItem{
                    Label("Blocks", systemImage:"square.fill")
                }
                .accentColor(Color("Calories"))
                
                BlocksEdit(blockStyles: $blockStyles, blockSee: $oneStyle, size: geometry.size, notifications: notification).tabItem{
                    Label("Edit Blocks", systemImage:"gearshape.fill")
                }
                .accentColor(Color("Calories"))
                
                FruitView(size: geometry.size).tabItem{
                    Label("Fruit List", systemImage:"leaf.fill")
                }
                .accentColor(Color("Calories"))
                
                MapView(size: geometry.size).tabItem{
                    Label("Map", systemImage:"globe")
                }.accentColor(Color("Calories"))
                
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
