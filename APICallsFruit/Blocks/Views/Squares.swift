//
//  Squares.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 10/6/23.
//

import Foundation
import SwiftUI

struct Squares: View {
    @Binding var radii: [Int]
    @Binding var color: Color
    let size: CGSize
    
    var body: some View {
        
        HStack{
            RoundedRectangle(cornerRadius: CGFloat(radii[0]))
                    .fill(color)
          
            RoundedRectangle(cornerRadius: CGFloat(radii[1]))
                .fill(color)

            RoundedRectangle(cornerRadius: CGFloat(radii[2]))
                    .fill(color)
            
            RoundedRectangle(cornerRadius: CGFloat(radii[3]))
                    .fill(color)
            
            RoundedRectangle(cornerRadius: CGFloat(radii[4]))
                    .fill(color)
         
        }
        .padding(.horizontal)
        .frame(width: 14*size.width/15, height: size.height/12)
    }
    
}
