import XCTest

@testable import mytestapp

class ListTableViewCellTests: XCTestCase {

    var tableView: UITableView!
    private var dataSource: TableViewDataSource!
    private var delegate: TableViewDelegate!

    override func setUp() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 400), style: .plain)
        
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "cell")
        dataSource = TableViewDataSource()
        delegate = TableViewDelegate()
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }

    func testCellPopulateWithNoData() {
        let indexPath = IndexPath(row: 0, section: 0)
        let itemCell = createCell(indexPath: indexPath)
        itemCell.populateWithNoData()

        XCTAssertFalse(itemCell.activityIndicador.isHidden)
        XCTAssertTrue(itemCell.repoNameLabel.isHidden)
        XCTAssertTrue(itemCell.repoAuthorNameLabel.isHidden)
        XCTAssertTrue(itemCell.repoAuthorPicture.isHidden)
        XCTAssertTrue(itemCell.repoStarsImageView.isHidden)
        XCTAssertTrue(itemCell.repoStarsCount.isHidden)
    }
    
    func testCellPopulateWithData() {
        let json = Repository.validJson()
        let repository = Repository(json: json)
        let indexPath = IndexPath(row: 0, section: 0)
        let itemCell = createCell(indexPath: indexPath)
        itemCell.populateWithData(repository: repository!, indexPathItem: indexPath.item)
        
        XCTAssertTrue(itemCell.activityIndicador.isHidden)
        XCTAssertFalse(itemCell.repoNameLabel.isHidden)
        XCTAssertFalse(itemCell.repoAuthorNameLabel.isHidden)
        XCTAssertFalse(itemCell.repoAuthorPicture.isHidden)
        XCTAssertFalse(itemCell.repoStarsImageView.isHidden)
        XCTAssertFalse(itemCell.repoStarsCount.isHidden)
    }

}

private class TableViewDataSource: NSObject, UITableViewDataSource {

    var items = [Repository]()

    override init() {
        super.init()

        // Initialize model, i.e. create&add object in items.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        return cell
    }
}

private class TableViewDelegate: NSObject, UITableViewDelegate {

}

extension ListTableViewCellTests {

    func createCell(indexPath: IndexPath) -> ListTableViewCell {
        let cell = dataSource.tableView(tableView, cellForRowAt: indexPath) as! ListTableViewCell
        XCTAssertNotNil(cell)

        let view = cell.contentView
        XCTAssertNotNil(view)

        return cell
    }
}
