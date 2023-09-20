//
//  FruitListView.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 9/19/23.
//

import SwiftUI

struct FruitListView: View {
    @State var fruits = [Fruit]()
    
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
                
                List(fruits) { fruit in
                    VStack(alignment: .leading) {
                        NavigationLink("\(fruit.name)", destination: FruitFactsView()
                        )
                    }
                }
                .task {
                    await getAllFruits()
                }
                
            }.navigationTitle("Fruits")
            
        }
    }
}

struct FruitListView_Previews: PreviewProvider {
    static var previews: some View {
        FruitListView()
    }
}
