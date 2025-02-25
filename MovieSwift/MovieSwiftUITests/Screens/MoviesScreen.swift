//
//  MoviesScreen.swift
//  MovieSwift
//
//  Created by Pedro Karsan on 21/02/2025.
//  Copyright © 2025 Thomas Ricouard. All rights reserved.
//
import XCTest
class MoviesScreen: BaseScreen {
    // Elements
    private var searchBar: XCUIElement { app.textFields.matching(identifier: "search_bar").firstMatch }
    private var moviesList: XCUIElementQuery { app.staticTexts.matching(identifier: "movie_title") }
    private var noResultLabel: XCUIElement { app.staticTexts["No results"].firstMatch }
    
    // Actions
    // Iterate through list of films until the correct one is found and tapped on
    func chooseFilm(_ filmName: String) {
        let movies = app.staticTexts.matching(identifier: "movie_title").allElementsBoundByIndex
        for movie in movies {
            if movie.label == filmName {
                movie.tap()
                break
            }
        }
    }

    // Search for a film by name using the search bar
    func searchMovie(_ movieName: String) {
        searchBar.waitForExistence(timeout: 5)
        searchBar.tap()
        searchBar.typeText(movieName)
    }

    // Assert that the filtered movie list contain the expected movie
    func isMoviesNameContains(_ movieName: String) -> Bool {
        XCTAssertTrue(moviesList.firstMatch.waitForExistence(timeout: 5), "Search bar not found.")
        for movie in moviesList.allElementsBoundByIndex {
            if !movie.label.contains(movieName) {
                return false
            }
        }
        return true
    }

    // Assert that the movie list has no results
    func isEmptyMoviesList() -> Bool {
        XCTAssertTrue(noResultLabel.waitForExistence(timeout: 5), "No results label not found.")
        return moviesList.count == 0 && noResultLabel.exists
    }
}
