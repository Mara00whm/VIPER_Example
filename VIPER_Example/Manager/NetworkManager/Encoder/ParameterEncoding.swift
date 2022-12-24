//
//  ParameterEncoding.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

internal typealias Parameters = [String: Any]

internal protocol ParameterEncoderProtocol {
    static func encode(urlRequest : inout URLRequest, parameters: Parameters) throws
}
