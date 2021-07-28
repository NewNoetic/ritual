//
//  ritualUITests.swift
//  ritualUITests
//
//  Created by Sidhant Gandhi on 12/26/20.
//

import XCTest

class ritualUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments.append("--resetData")
        app.launchArguments.append("--disableIntro")
        app.launchArguments.append("--showTaps")
        app.launchArguments.append("-testing")
        addUIInterruptionMonitor(withDescription: "allow notification alert") { alert in
            if alert.label.lowercased().contains("would like to send you notifications") {
                alert.buttons["Allow"].tap()
                return true
            }
            
            return false
        }
//        setupSnapshot(app)
        app.activate()
    }

    func testSwipeCards() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sleep(2)
        app.swipeLeft()
        sleep(2)
        app.swipeLeft()
        sleep(2)
        app.swipeLeft()
        sleep(2)
        app.buttons["arrow.clockwise.circle"].tap()
        sleep(2)
    }
}
