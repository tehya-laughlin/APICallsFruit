//
//  FruitView.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 10/5/23.
//

import SwiftUI

struct FruitView: View {
    
    @ObservedObject var viewModel = FruitViewModel()
    let size: CGSize
    @State var genFamOrderToggle: Bool = false
    @State var searchValue: String = ""
    
    var placeholder: String {
        if(genFamOrderToggle){
            return "Search family, order, or genus"
        } else {
            return "Search name"
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            if(viewModel.viewState == .loading){
                ProgressView()
            } else if (viewModel.viewState == .error){
                Text("error: cannot load content")
            } else {
                VStack{
                    MenuView(isFiltered: $genFamOrderToggle)
                    List(viewModel.generateSearchResults(searchValue: searchValue, isFiltered: genFamOrderToggle)) { fruit in
                        VStack(alignment: .leading) {
                            NavigationLink(){
                                FruitDetails(fruit: fruit, size: size)
                            } label:{
                                FruitLabel(fruit: fruit)
                            }
                        }
                    }
                    .task {
                        viewModel.getAllFruits()
                    }
                    
                }.navigationTitle("Fruits")
            }
            
        }.searchable(text:$searchValue, prompt: placeholder)
    }
        
    }


struct FruitView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader{ geometry in
            FruitView(size: geometry.size)
        }
    }
}
