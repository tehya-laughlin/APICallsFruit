//
//  FruitLabel.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 9/27/23.
//

import SwiftUI

struct FruitLabel: View {
    var fruit: Fruit
    
    var body: some View {
        VStack(alignment: .leading){
            Text("\(fruit.name)")
            Text("\(fruit.family) - \(fruit.order) - \(fruit.genus)")
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
    }
}
