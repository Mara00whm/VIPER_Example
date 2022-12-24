//
//  NetworkRouter.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

internal typealias NetworkRouterCompletion = (_ data: Data?,
                                            _ response: URLResponse?,
                                            _ error: Error?) -> Void

internal protocol NetworkRouterProtocol: AnyObject {
    associatedtype EndPoint: EndPointProtocol

    func request(_ route: EndPoint, completionHandler : @escaping NetworkRouterCompletion)
    func sendRequest<T: Decodable>(endpoint: EndPoint, responseModel: T.Type) async -> Result<T, RequestError>

    func cancel()
}
