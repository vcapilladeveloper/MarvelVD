//
//  RequestManager.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import UIKit

// Manager to make the request to the API.
// In this project, all requests are GET type.
final class RequestManager: NSObject {

    static var defaultSession: URLSession!
    static var dataGetTask: URLSessionDataTask?
    typealias requestResult = (_ data: Any?, _ error: Bool) -> Void
    
    class func getResult(_ url: String, completionHandler: @escaping requestResult) {
        let encryptUrl = EncryptMarvelRequestVD().encryptForRequestData(url, Date())
        dataGetTask?.cancel()
        defaultSession = URLSession(configuration: .default)
        var urlRequest = URLRequest(url: encryptUrl)
        print(encryptUrl.absoluteString)
        urlRequest.httpMethod = "GET"
        dataGetTask = defaultSession.dataTask(with: urlRequest) { data, response, error in
            if let response = response as? HTTPURLResponse { print(response.statusCode) }
            defer { self.dataGetTask = nil }
            if let error = error {
                completionHandler(data, true)
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 300 {
                completionHandler(data, false)
            } else {
                completionHandler(nil, true)
            }
        }
        defer {dataGetTask?.resume()}
    }
    
    
}
