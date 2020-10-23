import Foundation
import Moya
import SwiftyJSON

class NetworkServiceAPI {
    
    static func request(target: NetworkAPI, successBlock: @escaping (Int, JSON) -> (), errorBlock: @escaping (MoyaError) -> ()) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let provider = MoyaProvider<NetworkAPI>()
        
        provider.request(target) { (result) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            switch result {
            case let .success(response):
                if let json = try? JSON(data: response.data){
                    successBlock(response.statusCode, json )
                } else {
                    successBlock(response.statusCode, JSON(true))
                }
            case let .failure(error):
                errorBlock(error)
            }
            
        }
        
    }
}

