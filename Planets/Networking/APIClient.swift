//
//  APIClinet.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import Foundation

final class APIClient : APIService {
    
   
    func fetchPlanets() async throws -> [Planet] {
        let url = URL(string: "https://swapi.dev/api/planets/")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let planetData = try JSONDecoder().decode(InitialData.self, from: data)
        return planetData.results
    }
    
}
