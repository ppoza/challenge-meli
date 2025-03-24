//
//  challenge_meliUITests.swift
//  challengeMeliUITests
//
//  Created by Pablo Poza on 22/03/2025.
//

import XCTest

@testable import challengeMeli

final class challengeMeliUITests: XCTestCase {
    
    
    let app = XCUIApplication()

   override func setUp() {
       continueAfterFailure = false
       app.launch()
       XCUIDevice.shared.orientation = .portrait
   }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testNavigationToSearch() throws {
        let input = app.textFields[.tagSearchInput]
        input.tap()
        input.typeText("Test")
        
        let nextButton = app.buttons[.tagSearchButton]
        nextButton.tap()
        
        let exists = app.descendants(matching: .any)[.tagSearchResulScreen].waitForExistence(timeout: 5)
        XCTAssert(exists, "Should exist")
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
