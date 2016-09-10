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
        XCUIApplication().terminate()
    }
    
    func testMainPage() {
        let app = XCUIApplication()
        XCTAssertTrue(app.staticTexts["titleLabel"].exists)
        XCTAssertTrue(app.navigationBars["Main"].staticTexts["Main"].exists)
        snapshot("launch")
    }

    func testTablePage() {
        let app = XCUIApplication()

        func waitForMovedTablePage() {
            let element = app.navigationBars["Table"].staticTexts["Table"]
            let existsPredicate = NSPredicate(format: "exists == true")
            expectationForPredicate(existsPredicate, evaluatedWithObject: element, handler: nil)
            waitForExpectationsWithTimeout(10, handler: nil)
        }

        app.buttons["nextPageButton"].tap()
        waitForMovedTablePage()
        snapshot("tablePage")
    }
}
