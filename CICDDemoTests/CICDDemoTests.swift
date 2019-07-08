//
//  CICDDemoTests.swift
//  CICDDemoTests
//
//  Created by Ray on 2019/6/28.
//  Copyright © 2019 Ray. All rights reserved.
//

import XCTest
@testable import CICDDemo

class CICDDemoTests: XCTestCase {

    private var vc: ViewController?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "main") as! ViewController
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        
        let p = vc?.testNumber(first: 50, second: 50) ?? 0
        XCTAssert(p == 100)
    }

}
