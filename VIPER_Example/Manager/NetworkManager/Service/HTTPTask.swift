//
//  HTTPTask.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

internal typealias HTTPHeaders = [String: String]

internal enum HTTPTask {
    case request

    case requestParameters(bodyParametrs: Parameters?,
                           urlParametrs: Parameters?)

    case requestParametersAndHeader(bodyParametrs: Parameters?,
                                    urlParametrs: Parameters?,
                                    additionalHeader: HTTPHeaders?)
}
