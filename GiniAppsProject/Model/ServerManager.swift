//
//  ServerManager.swift
//  GiniAppsProject
//
//  Created by Neria Jerafi on 15/10/2020.
//

import Foundation
import Alamofire
enum ApiError:Error {
    case failure
}

class ServerManager {
   static let shared = ServerManager()
    private init(){}
    func getRequest<T:Decodable>(stringUrl:String,CompletionHandler:@escaping(Result<T,ApiError>)->()) {
        
        
        guard let url = URL(string: stringUrl) else { return }
        AF.request(url, method: .get).responseData { (response) in
            if let responseData = response.data{
                do {
                    let data =  try JSONDecoder().decode(T.self, from: responseData)
                    CompletionHandler(.success(data))
                }
                catch  {
                    CompletionHandler(.failure(.failure))
                }
            }
            else{
                CompletionHandler(.failure(.failure))
            }
        }
        
        
    }
}
