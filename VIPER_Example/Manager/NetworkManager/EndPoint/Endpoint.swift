//
//  Endpoint.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

enum NetworkEndpoint {
    case getScienseNews
}

extension NetworkEndpoint: EndPointProtocol {
    var baseURL: URL {
        URL(string: EndpointConstants.baseURL)!
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var task: HTTPTask {
        switch self {
        case .getScienseNews:
            return .request
        }
    }
    
    var header: HTTPHeaders? {
        nil
    }
    
    var path: String {
        EndpointConstants.articles
    }
    
    
}
