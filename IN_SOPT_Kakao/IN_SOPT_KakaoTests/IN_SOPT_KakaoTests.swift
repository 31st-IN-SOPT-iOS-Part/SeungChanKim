//
//  IN_SOPT_KakaoTests.swift
//  IN_SOPT_KakaoTests
//
//  Created by 김승찬 on 2022/10/02.
//

import XCTest
@testable import IN_SOPT_Kakao

class IN_SOPT_KakaoTests: XCTestCase {
    
    var sut: SignUpViewModel!

    override func setUpWithError() throws {
        sut = SignUpViewModel(coordinator: DefaultLoginCoordinator(UINavigationController()))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_올바른이메일입력() {
        let input = "23123@dads.com"
        
        let result = input.isValidEmail()
        
        XCTAssertTrue(result)
    }
    
    func test_올바르지않은_이메일입력() {
        let input = "123123"
        
        let result = input.isValidEmail()
        
        XCTAssertFalse(result)
    }
    
    func test_올바른_비밀번호입력() {
        let input = "tmdcks12!!!!"
        
        let result = input.isValidPassword()
        
        XCTAssertTrue(result)
    }
    
    func test_올바르지않은_비밀번호입력() {
        let input = "1234"
        
        let result = input.isValidPassword()
        
        XCTAssertFalse(result)
    }
    
    func test_이메일_패스워드_맞을때() {
        let email = "chanchu@hansung.ac.kr"
        let password = "chchch112!"
        
        let result = sut.checkEmailPassword(email: email, password: password)
        
        XCTAssertTrue(result)
    }
    
    func test_이메일_패스워드_틀릴때() {
        let email = "chanchu@hansung.ac.kr"
        let password = "1234"
        
        let result = sut.checkEmailPassword(email: email, password: password)
        
        XCTAssertFalse(result)
    }
}
