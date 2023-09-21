//
//  FruitListView.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 9/19/23.
//

import SwiftUI

struct FruitListView: View {
    @State var fruits = [Fruit]()
    @State var searchValue: String = ""
    
    func getAllFruits() async -> () {
            do {
                let url = URL(string: "https://www.fruityvice.com/api/fruit/all")!
                let (data, _) = try await URLSession.shared.data(from: url)
                print(data)
                fruits = try JSONDecoder().decode([Fruit].self, from: data)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                List(searchResults) { fruit in
                    VStack(alignment: .leading) {
                        NavigationLink("\(fruit.name)"){
                            VStack{
                                
                                Spacer()
                                    .frame(width: 100.0, height: 100.0)
                                
                                Text("\(fruit.family) Family")
                                    .font(.headline)
                            
                                Spacer()
                                    .frame(width: 100.0, height: 100.0)

                
                                VStack(alignment: .leading){
                                    Text("Nutrition Facts")
                                        .font(.headline)
                                        .padding(.bottom, 10)
                                    Text("Calories: \(fruit.nutritions.calories)")
                                    Text("Carbohydrates: \(fruit.nutritions.carbohydrates)")
                                    Text("Fat: \(fruit.nutritions.fat)")
                                    Text("Protein: \(fruit.nutritions.protein)")
                                    Text("Sugar: \(fruit.nutritions.sugar)")
                                }
                                .padding(10)
                                .border(Color.black, width: 3)
                                
                                
                                Spacer()
                                
                                
                            }.navigationTitle("\(fruit.name)")
                                
                        
                        }
                        
                    }
                }
                .task {
                    await getAllFruits()
                }
                
            }.navigationTitle("Fruits")
                
            
        }.searchable(text:$searchValue)
    }
    
    var searchResults: [Fruit] {
        if searchValue.isEmpty {
            return fruits
        } else {
            return fruits.filter { $0.name.contains(searchValue)}
        }
    }
    
}

struct FruitListView_Previews: PreviewProvider {
    static var previews: some View {
        FruitListView()
    }
}
