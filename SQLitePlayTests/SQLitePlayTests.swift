//
//  SQLitePlayTests.swift
//  SQLitePlayTests
//
//  Created by S. M. Hasibur Rahman on 29/10/23.
//

import XCTest
@testable import SQLitePlay

class SQLitePlayTests: XCTestCase {
    let dbManager = DbManager()

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDbCreation() {
        dbManager.createDatabase()
    }
    
    func testDbDeletion() {
        DbManager().deleteDatabase()
    }
    
    func testCreateUserTable() {
//        let table = dbManager.createUserTable()
//        XCTAssertNotNil(table)

        let loaneeTable = dbManager.createLoaneeTable()
        XCTAssertNotNil(loaneeTable)
    }
    
    func testInsertData() {
//        dbManager.usersTable = dbManager.createUserTable()
//        dbManager.insertUserData()

        dbManager.createLoaneeTable()
        dbManager.insertLoaneeData()
    }
}
