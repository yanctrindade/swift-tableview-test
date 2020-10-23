import Foundation
import Moya

enum NetworkAPI {
    case RepositoriesList(language: String, sort: String, page: Int, itemsPerPage: Int)
}

extension NetworkAPI: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .RepositoriesList(_, _, _, _):
            return "/search/repositories"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .RepositoriesList:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .RepositoriesList:
            return Data()
        }
    }
    
    public var task: Task {
        switch self {
        case .RepositoriesList(let language, let sort ,let page, let itemsPerPage):
            return .requestParameters(parameters:
                ["q" : "language:\(language)",
                "sort": sort,
                "page" : page,
                "per_page": itemsPerPage], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
}

