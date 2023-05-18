//
//  PlanetViewModel.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import Foundation

class PlanetViewModel : Identifiable{
    
     let planet: Planet
    
    var id: String {
        planet.name
    }
    
    init(planet: Planet) {
        self.planet = planet
    }
}

extension PlanetViewModel: PlanetPresentable {
   
   @objc var name: String {
        planet.name
    }
   
}
