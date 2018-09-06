//
//  EncryptMarvelRequestVD.swift
//  MarvelVD
//
//  Created by Victor Capilla Developer on 3/9/18.
//  Copyright © 2018 Victor Capilla Borrego. All rights reserved.
//

import Foundation
import CryptoSwift
// Helper to make the encryptation of the keys and generate the needed
// information to make the requests to the API.
final class EncryptMarvelRequestVD {
    
    func encryptForRequestData(_ url: String, _ date: Date) -> URL {
        return URL(string: "\(url)&ts=\(date.timestamp)&apikey=\(publicKey)&hash=\(makeHash(date.timestamp))")!
    }
    
    private func makeHash(_ timestamp: UInt64) -> String{
        return "\(timestamp)\(privateKey)\(publicKey)".md5()
    }
    
}
