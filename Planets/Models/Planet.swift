//
//  Planet.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import Foundation

struct InitialData: Decodable {

    // MARK: - properties
    let results: [Planet]
    
}

struct Planet: Codable {
    let name: String
}

extension Planet {
    static var preview: Planet {
        previews[0]
    }
    
    static var previews: [Planet]{
        [
            .init(name: "Earth"),
            .init(name: "Mars"),
            .init(name: "Venus")
        ]
    }
    
    static var previewsData: Data {
        try! JSONEncoder().encode(Planet.previews)
    }
}
