//
//  JSONParameterEncoder.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

struct JSONParameterEncoder: ParameterEncoderProtocol {
    internal static func encode(urlRequest: inout URLRequest, parameters: Parameters) throws {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters,
                                                  options: .prettyPrinted)
            urlRequest.httpBody = jsonData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }

    }

}
