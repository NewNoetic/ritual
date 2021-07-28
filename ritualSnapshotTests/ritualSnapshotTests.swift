//
//  ritualSnapshotTests.swift
//  ritualSnapshotTests
//
//  Created by sg on 7/27/21.
//

import XCTest

class ritualSnapshotTests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
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
        setupSnapshot(app)
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSwipeCards() throws {
        sleep(2)
        snapshot("1")
        app.swipeLeft()
        sleep(2)
        snapshot("2")
        app.swipeLeft()
        sleep(2)
        snapshot("3")
        app.swipeLeft()
        sleep(2)
    }
}
