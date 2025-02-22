//
//  MovieDetailTest.swift
//  MovieSwift
//
//  Created by Pedro Karsan on 21/02/2025.
//  Copyright © 2025 Thomas Ricouard. All rights reserved.
//
import XCTest

class MovieDetailTest: BaseTest {
    private var moviesScreen: MoviesScreen!
    private var movieDetailScreen: MovieDetailScreen!
    
    override func setUp() {
        super.setUp()
        moviesScreen = MoviesScreen(app: app)
        movieDetailScreen = MovieDetailScreen(app: app)
    }

    func testSelectMovie() {
        let movieName = "Panda Plan"
        moviesScreen.chooseFilm(movieName)
        XCTAssertTrue(movieDetailScreen.isTitleVisible(movieName), "Movie name is incorrect.")
    }
}
