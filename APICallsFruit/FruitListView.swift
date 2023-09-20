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
                
                HStack{
                
                }
                
                List(searchResults) { fruit in
                    VStack(alignment: .leading) {
                        NavigationLink("\(fruit.name)"){
                            VStack{
                                
                                
                                
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
