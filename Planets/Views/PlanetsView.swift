//
//  PlanetsView.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import SwiftUI

struct PlanetsView: View {
        // MARK: - properties
    @ObservedObject var viewModel : PlanetsViewModel
    
        // MARK: - view
    
    var body: some View {
        NavigationView {
            List(viewModel.planetViewModels){ presentable in
                PlanetView(presentable: presentable)
            }
            .navigationTitle("Planets")
            .task {
                await viewModel.start()
            }
        }
    }
}

struct PlanetsView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsView(viewModel: .init(apiService: APIClient(), store: PreviewStore()))
    }
}
