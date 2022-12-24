//
//  URLParameterEncoder.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

internal struct URLParameterEncoder: ParameterEncoderProtocol {
    internal static func encode(urlRequest: inout URLRequest, parameters: Parameters) throws {

        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
           !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()

            for (name, value) in parameters {
                let queryItem = URLQueryItem(name: name,
                                             value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }

        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }

    }

}
