import UIKit

class ListUIController: UIView {
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.lightGray
        return refreshControl
    }()
    
    var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListUIController: RenderViewProtocol {
    func buildViewHierarchy() {
        addSubview(tableView)
        tableView.refreshControl = refreshControl
        tableView.addSubview(refreshControl)
    }
    
    func setupConstraints() {
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    func additionalViewSetup() {
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = 80
        backgroundColor = .darkGray
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
    }
    
}
