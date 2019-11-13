//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Marcos on 11/12/19.
//  Copyright © 2019 Mobgen. All rights reserved.
//

import XCTest
@testable import StringCalculator

class StringCalculatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
//    func testIfSendingEmptyStringTestReturnZero() {
//        let sut = StringCalculator()
//        let result = sut.add(number:"")
//
//        XCTAssertEqual(0, result)
//    }
//
//    func testIfSendingOnlyOneNumberThatNumberIsReturned() {
//        let sut = StringCalculator()
//        let result = sut.add(number:"11")
//        XCTAssertEqual(11, result)
//
//        let result2 = sut.add(number: "33453")
//        XCTAssertEqual(33453, result2)
//    }
//
    private let scenarios: [(input: String, expectedResult: Int)] = [("", 0), ("0", 0), ("2", 2), ("1,3", 4), ("1 ,3", 4)]
    
    private let negScenarios: [(input: String, expectedResult: Int)] = [("-2, 1", 0)]
    
    func testIfSendingMultipleNumbersTheyAreAddedAndReturned() {
        let sut = StringCalculator()
        for test in scenarios {
            do {
                let result = try sut.add(number:test.input)
                XCTAssertEqual(test.expectedResult, result)
            } catch {
                //Grats
            }
        }
        
    }
    
    func testNegativeValues() {
        let sut = StringCalculator()
        for test in negScenarios {
            do {
                let result = try sut.add(number:test.input)
                XCTAssertEqual(test.expectedResult, result)
            } catch ErrorsToThrow.negativeNumber {
                //Grats
            } catch {
                //more grats
            }
        }
    }
    
    func testNegativeValues2() {
        let sut = StringCalculator()
        for test in negScenarios {
            XCTAssertThrowsError(try sut.add(number:test.input))
//            do {
//                //let result = try sut.add(number:test.input)
//                XCTAssertThrowsError(try sut.add(number:test.input))
//            } catch ErrorsToThrow.negativeNumber {
//                //Grats
//            } catch {
//                //more grats
//            }
        }
    }

}
