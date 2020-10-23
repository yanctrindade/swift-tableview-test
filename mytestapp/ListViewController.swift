import UIKit
import Moya
import SwiftyJSON

class ListViewController: UIViewController {
    
    struct Constants {
        static let ITEMS_PER_PAGE = 10
        static let LANGUAGE = "swift"
        static let SORT = "stars"
    }
    
    let uiController = ListUIController()
    var repositoryList: [Repository] = []
    var currentPage = 1
    var totalCount = 0
    var isFetchInProgress = false
    
    override func loadView() {
        self.view = uiController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadData()
    }
    
    func setupTableView() {
        uiController.tableView.dataSource = self
        uiController.tableView.delegate = self
        uiController.tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "cell")
        uiController.refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }
    
    func loadData() {
        guard !isFetchInProgress else {
          return
        }
        isFetchInProgress = true
        
        NetworkServiceAPI.request(target: .RepositoriesList(language: Constants.LANGUAGE,
                                                            sort: Constants.SORT,
                                                            page: currentPage,
                                                            itemsPerPage: Constants.ITEMS_PER_PAGE),
        successBlock: { (statusCode, json) in
            self.isFetchInProgress = false
            self.currentPage += 1
            
            guard let jsonArray = json["items"].array else {
                self.presentAlert(title: "Ops!", message: json["message"].stringValue, buttonText: "OK")
                return
            }
                        
            for json in jsonArray {
                let newItem = Repository(json: json)
                if let itemWrapped = newItem {
                    self.repositoryList.append(itemWrapped)
                }
            }
            
            self.totalCount = json["total_count"].intValue
            self.uiController.tableView.reloadData()
            self.uiController.tableView.refreshControl?.endRefreshing()
        }) { (error) in
            self.presentAlert(title: "Ops!", message: error.localizedDescription, buttonText: "OK")
            self.isFetchInProgress = false
            self.uiController.tableView.refreshControl?.endRefreshing()
        }
    }
    
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if repositoryList.count < totalCount {
            return repositoryList.count + 1
        } else {
            return totalCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ListTableViewCell
        if (indexPath.item < repositoryList.count) {
            cell.populateWithData(repository: repositoryList[indexPath.item], indexPathItem: indexPath.item+1)
        } else {
            cell.populateWithNoData()
        }
        return cell
    }
    
    @objc func refresh(_ sender: AnyObject) {
        loadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == repositoryList.count-1 {
            loadData()
        }
    }
}
