//
//  EndpointProtocol.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

internal protocol EndPointProtocol {
    var baseURL: URL {get}
    var httpMethod: HTTPMethod {get}
    var task: HTTPTask {get}
    var header: HTTPHeaders? {get}
    var path: String {get}
}
