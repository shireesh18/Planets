//
//  UserDefaults+Helpers.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import Foundation

extension UserDefaults {
    
    private enum Keys {
        static let planets = "planets"
    }
    
    @objc var planets: Data? {
        get {
            data(forKey: Keys.planets)
        }
        set{
            set(newValue, forKey: Keys.planets)
        }
    }
    
    func savePlanetsToUserDefaults(_ planet: Planet) throws {
        
        var planets: [Planet] = try decode(
            [Planet].self,
            forKey: Keys.planets
        ) ?? []
        
        planets.append(planet)
        
        try encode(planets, forKey: Keys.planets)
    }
}

fileprivate extension UserDefaults {
    
    func decode<T: Decodable>(_ type: T.Type, forKey key: String) throws -> T? {
        guard let data = data(forKey: key) else {
            return nil
        }
        
        return try? JSONDecoder().decode(type, from: data)
    }
    
    func encode<T: Encodable>(_ value: T, forKey key: String) throws {
        let data = try JSONEncoder().encode(value)
        
        set(data, forKey: key)
    }
}
