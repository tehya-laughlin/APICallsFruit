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
    let size: CGSize
    @State var genFamOrderToggle: Bool = false
    
    var placeholder: String {
        if(genFamOrderToggle){
            return "Search family, order, or genus"
        } else {
            return "Search name"
        }
    }
    
    func generateSearchResults() -> [Fruit] {
        if searchValue.isEmpty{
            return fruits
        } else {
            if(genFamOrderToggle){
                return fruits.filter { $0.family.contains(searchValue) ||  $0.order.contains(searchValue) ||  $0.genus.contains(searchValue)}
            } else {
                return fruits.filter { $0.name.contains(searchValue)}
            }
        }
    }
    
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
                    
                MenuView(isFiltered: $genFamOrderToggle)
                
                List(generateSearchResults()) { fruit in
                    VStack(alignment: .leading) {
                        NavigationLink(){
                            FruitDetails(fruit: fruit, size: size)
                        } label:{
                            FruitLabel(fruit: fruit)
                        }
                    }
                }
                .task {
                    await getAllFruits()
                }
                
            }.navigationTitle("Fruits")
                
            
        }.searchable(text:$searchValue, prompt: placeholder)
    }
    
    
    
}

struct FruitListView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ geometry in
            FruitListView(size: geometry.size)
        }
    }
}
