//
//  task_4Tests.swift
//  task#4Tests
//
//  Created by Nikita Entin on 05.07.2021.
//

import XCTest
@testable import task_4

final class task_4Tests: XCTestCase {
    
    let mock = ViewModel()
    
    let invalidEmails = [
        "0qwe@gmail.com",
        ".qw1@mail.ru",
        "-12qwds@yandex.ru",
        "dcx..r@fg@yandex.ru"
    ]
    
    let invalidNicks = [
        "1",
        "-12343",
        ".asqwe"
    ]
    
    let invalidLength = [
        "qw",
        "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"
    ]
    
    let validEmails = [
        "qwe@gmail.com",
        "q1-sd@rambler.ru"
    ]
    
    let validNicks = [
    "qwe",
        "q1-",
        "q.werefd",
        "QHJGEHDKJ123bdnQK---"
    ]
    
    func testInvalidEmails() {
        invalidEmails.forEach {
            XCTAssert(mock.checkEmail(email: $0) == false)
        }
    }
    
    func testInvalidNicks() {
        invalidNicks.forEach {
            XCTAssert(mock.checkNick(login: $0) == false)
        }
    }
    
    func testInvalidLength() {
        invalidLength.forEach {
            XCTAssert(mock.checkLogin(login: $0) == false)
        }
    }
    
    func testValidEmail() {
        validEmails.forEach {
            XCTAssert(mock.checkEmail(email: $0))
        }
    }
    
    func testValidNicks() {
        validNicks.forEach {
            XCTAssert(mock.checkNick(login: $0))
        }
    }
}
