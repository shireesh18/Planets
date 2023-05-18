//
//  UserDefaults+Store.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import Combine
import Foundation

extension UserDefaults: Store {
    var planetsPublisher: AnyPublisher<[Planet], Never> {
        UserDefaults.standard.publisher(for: \.planets)
            .compactMap { $0 }
            .decode(
                type: [Planet].self, decoder: JSONDecoder()
            )
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
