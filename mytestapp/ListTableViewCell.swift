import UIKit
import SDWebImage

class ListTableViewCell: UITableViewCell {
    
    let repoNameLabel = UILabel()
    let repoAuthorNameLabel = UILabel()
    let repoAuthorPicture = UIImageView()
    let repoStarsCount = UILabel()
    let repoStarsImageView = UIImageView()
    let activityIndicador = UIActivityIndicatorView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populateWithData(repository: Repository, indexPathItem: Int) {
        repoNameLabel.isHidden = false
        repoAuthorNameLabel.isHidden = false
        repoAuthorPicture.isHidden = false
        repoStarsCount.isHidden = false
        repoStarsImageView.isHidden = false
        activityIndicador.isHidden = true
        repoNameLabel.text =  "\(indexPathItem). \(repository.name)"
        repoAuthorNameLabel.text = repository.authorName
        repoAuthorPicture.sd_setImage(with: URL(string: repository.authorNamePictureURL))
        repoStarsCount.text = "\(repository.starsCount)"
    }
    
    func populateWithNoData() {
        repoNameLabel.isHidden = true
        repoAuthorNameLabel.isHidden = true
        repoAuthorPicture.isHidden = true
        repoStarsCount.isHidden = true
        repoStarsImageView.isHidden = true
        activityIndicador.isHidden = false
        activityIndicador.startAnimating()
    }
    
}

extension ListTableViewCell: RenderViewProtocol {
    func buildViewHierarchy() {
        repoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        repoAuthorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        repoAuthorPicture.translatesAutoresizingMaskIntoConstraints = false
        repoStarsImageView.translatesAutoresizingMaskIntoConstraints = false
        repoStarsCount.translatesAutoresizingMaskIntoConstraints = false
        activityIndicador.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(repoAuthorPicture)
        addSubview(repoNameLabel)
        addSubview(repoAuthorNameLabel)
        addSubview(repoStarsImageView)
        addSubview(repoStarsCount)
        addSubview(activityIndicador)
    }
    
    func setupConstraints() {
        activityIndicador.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        activityIndicador.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        
        repoAuthorPicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        repoAuthorPicture.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        repoAuthorPicture.heightAnchor.constraint(equalToConstant: 60).isActive = true
        repoAuthorPicture.widthAnchor.constraint(equalToConstant: 60).isActive = true
        repoAuthorPicture.layer.cornerRadius = 30
        repoAuthorPicture.clipsToBounds = true
        
        repoNameLabel.leadingAnchor.constraint(equalTo: repoAuthorPicture.trailingAnchor, constant: 8).isActive = true
        repoNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        repoNameLabel.topAnchor.constraint(equalTo: self.repoAuthorPicture.topAnchor, constant: 0).isActive = true
        
        repoAuthorNameLabel.topAnchor.constraint(equalTo: repoNameLabel.bottomAnchor, constant: 0).isActive = true
        repoAuthorNameLabel.leadingAnchor.constraint(equalTo: repoNameLabel.leadingAnchor, constant: 0).isActive = true
        repoAuthorNameLabel.trailingAnchor.constraint(equalTo: repoNameLabel.trailingAnchor, constant: 0).isActive = true
        
        repoStarsImageView.topAnchor.constraint(equalTo: repoAuthorNameLabel.bottomAnchor, constant: 0).isActive = true
        repoStarsImageView.leadingAnchor.constraint(equalTo: repoAuthorNameLabel.leadingAnchor, constant: 0).isActive = true
        repoStarsImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        repoStarsImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        repoStarsImageView.image = UIImage(named: "star")
        
        repoStarsCount.leadingAnchor.constraint(equalTo: repoStarsImageView.trailingAnchor, constant: 4).isActive = true
        repoStarsCount.centerYAnchor.constraint(equalTo: repoStarsImageView.centerYAnchor, constant: 0).isActive = true
    }
    
    func additionalViewSetup() {
        selectionStyle = .none
        backgroundColor = .white
    }
    
    
}
