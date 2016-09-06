import XCTest

final class FastlaneBoxUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testTitleLabel() {
        let app = XCUIApplication()
        XCTAssertTrue(app.staticTexts["titleLabel"].exists)
        snapshot("launch")
    }
}
