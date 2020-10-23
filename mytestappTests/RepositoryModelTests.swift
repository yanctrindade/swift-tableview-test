import Nimble
import Quick
import SwiftyJSON

@testable import mytestapp

extension Repository {
    static func validJson() -> JSON {
        return [
            "name": "john-doe-swift",
            "stargazers_count": 300,
            "owner": ["login" : "jonhndoe", "avatar_url" : "https://www.google.com.br"]
        ]
    }
}

class RepositoryModelTests: QuickSpec {
    
    override func spec() {
        describe("Repository") {
            var repository: Repository!
            var validJson: JSON!
            
            beforeEach {
                validJson =  Repository.validJson()
            }
            
            it("should parse all properties") {
                repository = Repository(json: validJson)
                
                expect(repository.name) == "john-doe-swift"
                expect(repository.authorName) == "jonhndoe"
                expect(repository.authorNamePictureURL) == "https://www.google.com.br"
                expect(repository.starsCount) == 300
            }
            
            it("should parse nil for missing name") {
                validJson.dictionaryObject?.removeValue(forKey: "name")
                repository = Repository(json: validJson)
                
                expect(repository).to(beNil())
            }
            
            it("should parse nil for missing stargazers_count") {
                validJson.dictionaryObject?.removeValue(forKey: "stargazers_count")
                repository = Repository(json: validJson)
                
                expect(repository).to(beNil())
            }
            
            it("should parse nil for missing owner") {
                validJson.dictionaryObject?.removeValue(forKey: "owner")
                repository = Repository(json: validJson)
                
                expect(repository).to(beNil())
            }
            
        }
    }
}
