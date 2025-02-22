//
//  MovieSwiftUITests.swift
//  MovieSwiftUITests
//
//  Created by Pedro Karsan on 21/02/2025.
//  Copyright © 2025 Thomas Ricouard. All rights reserved.
//

import XCTest

final class MovieSwiftUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        let movies = app.staticTexts.matching(identifier: "movie_title").allElementsBoundByIndex
        for movie in movies {
            if movie.label == "Panda Plan" {
                movie.tap()
                break
            }
        }
        XCTAssertTrue(app.staticTexts["Panda Plan"].waitForExistence(timeout: 5), "You are on the wrong movie screen.")
    }
}
