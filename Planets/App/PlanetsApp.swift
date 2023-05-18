//
//  PlanetsApp.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import SwiftUI

@main
struct PlanetsApp: App {
    var body: some Scene {
        WindowGroup {
            PlanetsView(viewModel: .init(apiService: APIClient(), store: UserDefaults.standard))
        }
    }
}
