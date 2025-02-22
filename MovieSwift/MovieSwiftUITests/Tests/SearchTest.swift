//
//  SearchTest.swift
//  MovieSwift
//
//  Created by Pedro Karsan on 21/02/2025.
//  Copyright © 2025 Thomas Ricouard. All rights reserved.
//
import XCTest

class SearchTest: BaseTest {
    private var moviesScreen: MoviesScreen!
    
    override func setUp() {
        super.setUp()
        moviesScreen = MoviesScreen(app: app)
    }
    
    func testSearchWithPartialName() {
        let movieName = "Captain America: Brave"
        moviesScreen.searchMovie(movieName)
        XCTAssertTrue(moviesScreen.isMoviesNameContains(movieName), "Movies is not filtered correctly.")
    }
    
    func testSearchWithFullName() {
        let movieName = "Captain America: Brave New World"
        moviesScreen.searchMovie(movieName)
        XCTAssertTrue(moviesScreen.isMoviesNameContains(movieName), "Movies is not filtered correctly.")
    }
    
    func testSearchInvalidMovieName() {
        let movieName = "Some random name"
        moviesScreen.searchMovie(movieName)
        XCTAssertTrue(moviesScreen.isEmptyMoviesList(), "Movies list is not empty.")
    }
    
    func testSearchEmptyMovieName() {
        let movieName = "  "
        moviesScreen.searchMovie(movieName)
        XCTAssertTrue(moviesScreen.isEmptyMoviesList(), "Movies list is not empty.")
    }
}
