//
//  PlanetView.swift
//  Planets
//
//  Created by Shireesh Marla on 18/05/2023.
//

import SwiftUI

struct PlanetView: View {
    
        // MARK: - Properties
    let presentable: PlanetPresentable
    
        // MARK: - View
    
    var body: some View {
        VStack(alignment: .leading){
            Text(presentable.name)
                .font(.title)
        }
    }
}

struct PlanetView_Previews: PreviewProvider {
    
    private struct PreviewPresentable: PlanetPresentable {
        var name: String {
            "Earth"
        }
    }
    
    static var previews: some View {
        PlanetView(presentable: PreviewPresentable())
    }
}
