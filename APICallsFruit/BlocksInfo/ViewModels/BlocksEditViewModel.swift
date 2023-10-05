//
//  BlocksEdit.swift
//  NavigationBlocks
//
//  Created by Tehya Laughlin on 9/12/23.
//

import SwiftUI


struct BlocksEdit: View {
    @Binding var blockStyles: [BlockStyle]
    @State var colorSwitch: Bool = false
    @Binding var blockSee: BlockStyle
    @State var isRadiiSheetOpen: Bool = false
    @State var radii: [Int] = [0,0,0,0,0]
    @State var isNewBlockAdded: Bool = false;
    @State var color: Color = Color.blue
    
    var body: some View {
        NavigationView {
            VStack {
                
                ColorPicker("Color", selection: $color)
                    .frame(width: 100.0, height: 100.0)
                
                //This button opens a sheet for number input for all the 5 radii
                Button("Radii") {
                    isRadiiSheetOpen = true
                }
                .sheet(isPresented: $isRadiiSheetOpen){
                    
                } content: {
                    Radii(radii: $radii)
                }
                
                //this button adds the blocks (default, or with edited color and radii) to the blockslist, displayed in home
                Button("Add Blocks"){
                    blockSee.radii = radii
                    blockSee.color = color
                    blockStyles.append(blockSee)
                    
                    radii = [0,0,0,0,0]
                    isNewBlockAdded = true
                    
                }.padding(.top, 30)
                
                //This displays the new blocks only, if they have been added
                if(isNewBlockAdded){
                    NavigationLink("See the new blocks or go to Blocks Tab"){
                        SeeNewBlocks(blocks: $blockSee)
                    }.padding(.top, 30)
                }
            }.onAppear{
                isNewBlockAdded = false
                //color = Color.blue
               
            }
            .navigationTitle("Edit Blocks")
        }
    }
}

