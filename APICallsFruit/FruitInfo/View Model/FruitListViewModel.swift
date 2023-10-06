//
//  FruitListViewModel.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 10/5/23.
//

import Foundation

class FruitViewModel: ObservableObject {
    
    enum ViewState {
        case loading
        case error
        case content
    }
    
    var fruits = [Fruit]()
    @Published var viewState: ViewState = .loading
    private var dataClient = DataClient()
    
    init(){
        getAllFruits()
    }
    
    
    func generateSearchResults(searchValue: String, isFiltered: Bool) -> [Fruit] {
        if searchValue.isEmpty{
            return fruits
        } else {
            if(isFiltered){
                return fruits.filter { $0.family.contains(searchValue) ||  $0.order.contains(searchValue) ||  $0.genus.contains(searchValue)}
            } else {
                return fruits.filter { $0.name.contains(searchValue)}
            }
        }
    }
    
    func getAllFruits(){
          /*  do {
                let url = URL(string: "https://www.fruityvice.com/api/fruit/all")!
                let (data, _) = try await URLSession.shared.data(from: url)
                print(data)
                fruits = try JSONDecoder().decode([Fruit].self, from: data)
            } catch {
                print("Error: \(error.localizedDescription)")
            }*/
        
        Task { @MainActor in
            do {
                guard let url = URL(string: "https://www.fruityvice.com/api/fruit/all") else {
                    viewState = .error
                    return
                }
                let urlRequestDetails = UrlRequestDetails(url: url)
                fruits = try await dataClient.requestWithAsync(urlRequestDetails: urlRequestDetails)
                viewState = .content
            } catch {
                print("Error: \(error.localizedDescription)")
                viewState = .error
            }
        }
    }
    
}

