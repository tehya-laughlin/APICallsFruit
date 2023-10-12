//
//  BlocksEditView.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 10/6/23.
//

import Foundation
import SwiftUI

struct BlocksEdit: View {
    @Binding var blockStyles: [BlockStyle]
    @Binding var blockSee: BlockStyle
    @State var isRadiiOpen: Bool = false
    @State var radii: [Int] = [0,0,0,0,0]
    @State var isNewAdded: Bool = false;
    @State var color: Color = Color.blue
    let size: CGSize
    var notifications: PushNotificationService
    
    var body: some View {
        NavigationView {
            VStack {
                
                ColorPicker("Color", selection: $color)
                    .frame(width: size.height/8, height: size.height/8)
                
                //button opens a sheet that takes user input
                Button("Radii") {
                    isRadiiOpen = true
                }
                .sheet(isPresented: $isRadiiOpen){
                    
                } content: {
                    Radii(radii: $radii, size: size)
                        .accentColor(Color("Calories"))
                }
                
                //adds blocks with color/radii input to blockStyles array
                Button("Add Blocks"){
                    
                    blockSee.radii = radii
                    blockSee.color = color
                    blockStyles.append(blockSee)
                    
                    radii = [0,0,0,0,0]
                    isNewAdded = true
                    
                    notifications.scheduleNotification(
                        title: "New Blocks",
                        subtitle: "New Blocks have been added!"
                    )
                    
                }.padding(.top, 30)
                
                //when new blocks are added, can view them here
                if(isNewAdded){
                    NavigationLink("See the new blocks or go to Blocks Tab"){
                        SeeNewBlocks(blocks: $blockSee, size: size)
                            .accentColor(Color("Calories"))
                    }.padding(.top, 30)
                }
                
            }.onAppear{
                isNewAdded = false
            }
            .navigationTitle("Edit Blocks")
        }
    }
}
