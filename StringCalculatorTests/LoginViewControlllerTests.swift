//
//  LoginViewControlllerTests.swift
//  StringCalculatorTests
//
//  Created by Marcos on 11/12/19.
//  Copyright © 2019 Mobgen. All rights reserved.
//

import XCTest
@testable import StringCalculator

class LoginViewControlllerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() {
        let sut = Login()
        XCTAssert(sut.loginInApp(user: "galicia", pass: "estalloviendo"))
        
    }
    
    func testLogout() {
        let sut = Logout(timeManager: FakeTimeClock())
        XCTAssert(sut.logoutOfApp())
    }
    
}

class FakeTimeClock: NSObject, Clock {
    func now() -> Int {
        return 4
    }
}
