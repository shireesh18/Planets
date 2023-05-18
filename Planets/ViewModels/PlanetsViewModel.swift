//
//  PlanetViewModel.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import Combine
import Foundation

@MainActor final class PlanetsViewModel : ObservableObject {
  
    // MARK: - properties
    private let apiService: APIService
    private let store: Store
    
    @Published private(set) var planetViewModels: [PlanetViewModel] = [] {
        didSet {
            for planetViewModel in planetViewModels {
                savePlanetsToUserDefaults(with: planetViewModel.planet)
            }
        }
    }
    
        // MARK: - initializer
    init(
         apiService: APIService,
         store: Store
    ){
        self.apiService = apiService
        self.store = store
   }
    
    func start() async {
        
        store.planetsPublisher
            .map { $0.map(PlanetViewModel.init(planet:))}
            .eraseToAnyPublisher()
            .assign(to: &$planetViewModels)
        
        if(planetViewModels.isEmpty){
            Task{
                do{
                    planetViewModels = try await apiService.fetchPlanets().map(PlanetViewModel.init)
                }catch {
                    print("Unable to Fetch Planets \(error)")
                }
            }
        }
    }
    
    func savePlanetsToUserDefaults(with planet: Planet){
        do{
            try store.savePlanetsToUserDefaults(planet)
        }catch{
            print("Unable to Add planets \(error)")
        }
    }
    
}
