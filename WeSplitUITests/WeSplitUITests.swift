//
//  WeSplitUITests.swift
//  WeSplitUITests
//
//  Created by Adam Ure on 6/6/22.
//

import XCTest

class WeSplitUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let app = XCUIApplication()
        app.launchArguments = [
                "-inUITest",
                "-AppleLanguages",
                "(zh)",
                "-AppleLocale",
                "zh-Hans"
            ]
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    func testSelectTipSegment() {
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["10%"]/*[[".cells[\"10%, 10%, 15%, 15%, 20%, 20%, 25%, 25%, 0%, 0%\"]",".segmentedControls.buttons[\"10%\"]",".buttons[\"10%\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(tablesQuery.buttons["10%"].isSelected, true)
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["15%"]/*[[".cells[\"10%, 10%, 15%, 15%, 20%, 20%, 25%, 25%, 0%, 0%\"]",".segmentedControls.buttons[\"15%\"]",".buttons[\"15%\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(tablesQuery.buttons["10%"].isSelected, false)
        XCTAssertEqual(tablesQuery.buttons["15%"].isSelected, true)
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["20%"]/*[[".cells[\"10%, 10%, 15%, 15%, 20%, 20%, 25%, 25%, 0%, 0%\"]",".segmentedControls.buttons[\"20%\"]",".buttons[\"20%\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(tablesQuery.buttons["15%"].isSelected, false)
        XCTAssertEqual(tablesQuery.buttons["20%"].isSelected, true)
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["25%"]/*[[".cells[\"10%, 10%, 15%, 15%, 20%, 20%, 25%, 25%, 0%, 0%\"]",".segmentedControls.buttons[\"25%\"]",".buttons[\"25%\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(tablesQuery.buttons["20%"].isSelected, false)
        XCTAssertEqual(tablesQuery.buttons["25%"].isSelected, true)
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["0%"]/*[[".cells[\"10%, 10%, 15%, 15%, 20%, 20%, 25%, 25%, 0%, 0%\"]",".segmentedControls.buttons[\"0%\"]",".buttons[\"0%\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(tablesQuery.buttons["25%"].isSelected, false)
        XCTAssertEqual(tablesQuery.buttons["0%"].isSelected, true)
    }
}
