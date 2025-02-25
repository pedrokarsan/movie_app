//
//  MovieDetailScreen.swift
//  MovieSwift
//
//  Created by Pedro Karsan on 21/02/2025.
//  Copyright © 2025 Thomas Ricouard. All rights reserved.
//
import XCTest

class MovieDetailScreen: BaseScreen {
    // Actions
    // Return bool if title is visible
    func isTitleVisible(_ title: String) -> Bool {
        return app.staticTexts[title].waitToExist(5)
    }
}
