//
//  XCUIElementExtension.swift
//  MovieSwift
//
//  Created by Pedro Karsan on 21/02/2025.
//  Copyright © 2025 Thomas Ricouard. All rights reserved.
//
import Foundation
import XCTest
let defaultTimeout: TimeInterval = 10
internal extension XCUIElement {
    @discardableResult
    func waitToExistAndBeHittable(_ timeToWait: TimeInterval = defaultTimeout) -> Bool {
        let exists = NSPredicate(format: "exists == true AND isHittable == true")
        return waitForExpectationsBase(predicate: exists, element: self, timeToWait: timeToWait)
    }
    func waitToExist(_ timeToWait: TimeInterval = defaultTimeout) -> Bool {
        let exists = NSPredicate(format: "exists == true")
        return waitForExpectationsBase(predicate: exists, element: self, timeToWait: timeToWait)
    }
}
private extension XCUIElement {
    func waitForExpectationsBase(predicate: NSPredicate, element: XCUIElement, timeToWait: TimeInterval) -> Bool {
        let expect = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter.wait(for: [expect], timeout: timeToWait)
        return result == .completed
    }
}
