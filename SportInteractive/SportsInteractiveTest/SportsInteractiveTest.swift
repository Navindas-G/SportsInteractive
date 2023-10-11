//
//  SportsInteractiveTest.swift
//  SportsInteractiveTest
//
//  Created by Navindas Ghadge on 11/10/23.
//

import XCTest

final class SportsInteractiveTest: XCTestCase {
    private var datasource: CricketMatchDatasource? = CricketMatchDatasource()
    var viewModel: CricketMatchViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
        
        self.viewModel = CricketMatchViewModel(dataSource: datasource!)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.datasource = nil
        self.viewModel = nil
        
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testViewModelDataOnSuccess() {
        self.viewModel?.getMatchData(for: Constant.instance.urlOne)
        self.viewModel?.onDataSuccess = { model in
            XCTAssertNotNil(model != nil)
            XCTAssertNotNil(model!.innings != nil)
            XCTAssertNotNil(model!.matchDetail != nil)
            XCTAssertNotNil(model!.notes != nil)
            XCTAssertNotNil(model!.nuggets != nil)
            XCTAssertNotNil(model!.teams != nil)
            
        }
    }
    
    func testViewModelDataOnFailure() {
        self.viewModel?.getMatchData(for: "")
        self.viewModel?.onDataFailure = { message in
            XCTAssertNotNil(message != "")
        }
    }

}
