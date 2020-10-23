import Foundation
import SwiftyJSON

class Repository {
    
    let authorNamePictureURL: String
    let authorName: String
    let starsCount: Int
    let name: String
    
    init?(json: JSON) {
        
        guard let authorNamePictureURL = json["owner"]["avatar_url"].string,
            let authorName = json["owner"]["login"].string,
            let starsCount = json["stargazers_count"].int,
            let name = json["name"].string else {
                return nil
        }
        
        self.authorNamePictureURL = authorNamePictureURL
        self.authorName = authorName
        self.starsCount = starsCount
        self.name = name
    }
    
}
