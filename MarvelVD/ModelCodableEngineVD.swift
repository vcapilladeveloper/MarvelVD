//
//  ModelCodableEngineVD.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

final class ModelCodableEngineVD {
    func genericConvert<T: Codable>(_ data: Data) -> (T?, String?){
        let decoder = JSONDecoder()
        do{
            let genericData = try decoder.decode(T.self, from: data)
            return (genericData, nil)
        } catch {
            print("Error \(error.localizedDescription)")
            return (nil, error.localizedDescription)
        }
    }
}
