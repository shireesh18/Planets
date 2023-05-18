//
//  Store.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import Combine

protocol Store {
    
    var planetsPublisher: AnyPublisher<[Planet], Never> { get }
    
    func savePlanetsToUserDefaults(_ planet: Planet) throws
}
