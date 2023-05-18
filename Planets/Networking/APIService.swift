//
//  APIService.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import Foundation

import Foundation

protocol APIService {
    func fetchPlanets() async throws -> [Planet]
}
