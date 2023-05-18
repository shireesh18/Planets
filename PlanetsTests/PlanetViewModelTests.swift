//
//  PlanetViewModelTests.swift
//  PlanetsTests
//
//  Created by Shireesh Marla on 18/05/2023.
//

import XCTest

@testable import Planets

final class PlanetViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testPlanetName(){
        let viewModel = PlanetViewModel(planet: .init(name: "Jupiter"))
        
        XCTAssertEqual(viewModel.name, "Jupiter")
    }

    
}

