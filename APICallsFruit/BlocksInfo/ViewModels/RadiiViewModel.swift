//
//  Radii.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 10/5/23.
//

import Foundation
import SwiftUI

struct Radii: View {
    @Binding var radii: [Int]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            
            Stepper(value: $radii[0], in: 0...35, step:5) {
                Text("Border Radius 1: \(radii[0])")
            }
            .frame(width: 275.0, height: 60.0)
            
            Stepper(value: $radii[1], in: 0...35, step:5) {
                Text("Border Radius 2: \(radii[1])")
            }
            .frame(width: 275.0, height: 60.0)
            
            Stepper(value: $radii[2], in: 0...35, step:5) {
                Text("Border Radius 3: \(radii[2])")
            }.frame(width: 275.0, height: 60.0)
            
            Stepper(value: $radii[3], in: 0...35, step:5) {
                Text("Border Radius 4: \(radii[3])")
            }.frame(width: 275.0, height: 60.0)
            
            Stepper(value: $radii[4], in: 0...35, step:5) {
                Text("Border Radius 5: \(radii[4])")
            }.frame(width: 275.0, height: 60.0)
            
            
            HStack {
                Button("Cancel") {
                    radii = [0,0,0,0,0]
                    dismiss()
                }
                Spacer()
                Button("Confirm") {
                    dismiss()
                }
            }
            .frame(width: 150.0, height: 60.0)
        }
    }
}
