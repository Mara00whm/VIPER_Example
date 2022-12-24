//
//  NetworkLayer.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

enum NetworkError: String, Error {
    case missingURL = "url equal nil"
    case missingParameters = "parameter equal nil"
    case encodingFailed = "Parameter encoding failed"
}

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
