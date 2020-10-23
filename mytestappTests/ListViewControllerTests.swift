import XCTest

@testable import mytestapp

class SideMenuViewControllerTest: XCTestCase {
    
    var viewControllerUnderTest: ListViewController!
    
    override func setUp() {
        super.setUp()
        
        self.viewControllerUnderTest = ListViewController()
        
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.uiController.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.uiController.tableView.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.uiController.tableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:willDisplay:forRowAt:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }

    func testTableViewCellHasReuseIdentifier() {
        let cell = viewControllerUnderTest.tableView(viewControllerUnderTest.uiController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? UITableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "cell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }

}
