//
//  TestPracticeTests.swift
//  TestPracticeTests
//
//  Created by 허예은 on 2020/12/16.
//

import XCTest
@testable import TestPractice

class TestPracticeTests: XCTestCase {

    func testAddStuff(){
        let math = MathStuff()
        
        let result = math.addNumbers(x: 1, y: 2)
        XCTAssertEqual(result, 3)
    }
    
    func testMultiplyStuff(){
        let math = MathStuff()
        
        let result = math.multiplyNumbers(x: 1, y: 2)
        XCTAssertEqual(result, 2)
    }
    
    func testDivideStuff(){
        let math = MathStuff()
        
        let result = math.divideNumbers(x: 10, y: 2)
        XCTAssertEqual(result, 5)
    }
}
