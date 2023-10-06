//
//  NewBlocksView.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 10/6/23.
//

import Foundation
import SwiftUI

struct SeeNewBlocks: View{
    @Binding var blocks: BlockStyle
    let size: CGSize
    
    var body: some View {
        NavigationView{
            VStack(content: {
                Squares(radii: $blocks.radii, color: $blocks.color, size: size)
            })
           
        } .navigationBarTitle("New Blocks")
    }
}
