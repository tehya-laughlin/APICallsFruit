//
//  SeeNewBlocks.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 10/5/23.
//

import Foundation
import SwiftUI

struct SeeNewBlocks: View{
    @Binding var blocks: BlockStyle
    
    var body: some View {
        NavigationView{
            VStack(content: {
                Squares(radii: $blocks.radii, color: $blocks.color)
            })
           
        } .navigationBarTitle("New Blocks")
    }
}
