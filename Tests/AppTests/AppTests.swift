import XCTest
@testable import App

class AppTests: XCTestCase {
    func testStub() throws {
        XCTAssert(true)
      do {
        try XCTFail()
      } catch is Error {
        print("Dio carognaccia!")
      }
    }
    
    static let allTests = [
        ("testStub", testStub),
    ]
}
