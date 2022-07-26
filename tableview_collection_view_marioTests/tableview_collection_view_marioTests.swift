//
//  tableview_collection_view_marioTests.swift
//  tableview_collection_view_marioTests
//
//  Created by David Granado Jordan on 7/22/22.
//

import XCTest
@testable import tableview_collection_view_mario

class tableview_collection_view_marioTests: XCTestCase {

    var sut: ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded()
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidTitle() throws {
        
        let validTitle = "My ViewController"
        
        
        XCTAssertEqual( sut.title, validTitle)
        
    }
    
    
    
    func testValidData() throws {
        sut.loadData()
        let validDataSize = 8
        
        
        
        
        XCTAssertEqual( sut.characters.count, validDataSize)
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
        measure( metrics: [
            XCTClockMetric(),
            XCTCPUMetric(),
            XCTStorageMetric(),
            XCTMemoryMetric()
          ]
        ) {
            // Put the code you want to measure the time of here.
            // Put the code you want to measure the time of here.
            
            let validDataSize = 8
            
            for index in 1...15000 {
                sut.loadData()
            }
            
            
            XCTAssertEqual( sut.characters.count, validDataSize)
            
        
            //XCTAssertEqual(true, true)
            
            
            
        }
    }

}
