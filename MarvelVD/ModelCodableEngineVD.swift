//
//  ModelCodableEngineVD.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation

final class ModelCodableEngineVD {
    func genericConvert<T: Codable>(_ data: Data) -> T?{
        let decoder = JSONDecoder()
        do{
            let genericData = try decoder.decode(T.self, from: data)
            return genericData
        } catch {
            print("Error \(error.localizedDescription)")
            return nil
        }
    }
}
