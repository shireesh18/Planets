//
//  PreviewStore.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import Combine

final class PreviewStore: Store {
    
    @Published private var planets = Planet.previews
    
    var planetsPublisher: AnyPublisher<[Planet], Never>{
        $planets
            .eraseToAnyPublisher()
    }
    
    func savePlanetsToUserDefaults(_ planet: Planet) throws {
        planets.append(planet)
    }
    
}
