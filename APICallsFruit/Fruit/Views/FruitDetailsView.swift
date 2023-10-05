//
//  FruitDetails.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 9/27/23.
//

import SwiftUI

struct FruitDetails: View {
    var fruit: Fruit
    var size: CGSize
    
    var body: some View{
   
        VStack{
            
            Text("\(fruit.family) - \(fruit.order) - \(fruit.genus)")
                .foregroundColor(Color.gray)
            
            HStack{
                ZStack{
                    Circle()
                        .foregroundColor(Color("Calories"))
                        
                    Text("Calories")
                        .foregroundColor(Color.white)
                }
                .frame(width: size.width / 3)
               
                ZStack{
                    Text("\(fruit.nutritions.calories)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Calories"))
                }
                .frame(width: size.width * 1.5 / 3, height: size.width/3)
            }
            .padding(.all)
            
         
            HStack{
                ZStack{
                    Circle()
                        .foregroundColor(Color("Micros"))
                        
                    Text("Fats")
                        .foregroundColor(Color.white)
                }
                .frame(width: size.width / 4)
               
                ZStack{
                    Rectangle()
                        .foregroundColor(Color.blue.opacity(0.0))
                        .border(Color("Micros"), width: 3)
                    
                    Text("\(fruit.nutritions.fat, specifier: "%.2f") g")
                        .font(.title2)
                        
                }
                .frame(width: size.width * 2 / 4, height: size.width/4)
            }
            .padding(.all)
            
            HStack{
                ZStack{
                    Circle()
                        .foregroundColor(Color("Micros"))
                        
                    Text("Sugar")
                        .foregroundColor(Color.white)
                }
                .frame(width: size.width / 4)
               
                ZStack{
                    Rectangle()
                        .foregroundColor(Color.blue.opacity(0.0))
                        .border(Color("Micros"), width: 3)
                    
                    Text("\(fruit.nutritions.sugar, specifier: "%.2f") g")
                        .font(.title2)
                        
                }
                .frame(width: size.width * 2 / 4, height: size.width/4)
            }
            .padding(.all)
            
            HStack{
                ZStack{
                    Circle()
                        .foregroundColor(Color("Micros"))
                        
                    Text("Protein")
                        .foregroundColor(Color.white)
                }
                .frame(width: size.width / 4)
               
                ZStack{
                    Rectangle()
                        .foregroundColor(Color.blue.opacity(0.0))
                        .border(Color("Micros"), width: 3)
                    
                    Text("\(fruit.nutritions.protein, specifier: "%.2f") g")
                        .font(.title2)
                        
                }
                .frame(width: size.width * 2 / 4, height: size.width/4)
            }
            .padding(.all)

        }.navigationTitle("\(fruit.name)")
    }
}

