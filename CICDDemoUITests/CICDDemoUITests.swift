//
//  CICDDemoUITests.swift
//  CICDDemoUITests
//
//  Created by Ray on 2019/7/8.
//  Copyright © 2019 Ray. All rights reserved.
//

import XCTest

class CICDDemoUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.buttons["點擊"].tap()
        app.otherElements.containing(.button, identifier:"點擊").children(matching: .textField).element.tap()
        app/*@START_MENU_TOKEN@*/.keys["delete"].press(forDuration: 9.9);/*[[".keyboards",".keys[\"刪除\"]",".tap()",".press(forDuration: 9.9);",".keys[\"delete\"]"],[[[-1,4,2],[-1,1,2],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/
        app.otherElements.containing(.button, identifier:"點擊").element.tap()
        
    }

    func testPresent() {
        
        let app = XCUIApplication()
        app.buttons["點擊"].tap()
        app.buttons["Button"].tap()
        
    }
}
