//
//  ModelCodableEngineVD.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

// Class in charge of take result from request and convert in data that whe need.
// The use of Generic is to specify in each request, the type of data we need to get.
final class ModelCodableEngineVD {
    func genericConvert<T: Codable>(_ data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            let genericData = try decoder.decode(T.self, from: data)
            return genericData
        } catch {
            print("Error \(error.localizedDescription)")
            return nil
        }
    }
}
