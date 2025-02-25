//
//  BaseScreen.swift
//  MovieSwift
//
//  Created by Pedro Karsan on 21/02/2025.
//  Copyright © 2025 Thomas Ricouard. All rights reserved.
//
import XCTest

// A base class for all screen objects in the UI tests
class BaseScreen {
    let app: XCUIApplication

    init(app: XCUIApplication = XCUIApplication()) {
        self.app = app
    }
}
