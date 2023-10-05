//
//  SquaresView.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 10/5/23.
//

import Foundation
import SwiftUI

struct Squares: View {
    @Binding var radii: [Int]
    @Binding var color: Color
    
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
        .frame(width: 400.0, height: 70.0)
    }
}
