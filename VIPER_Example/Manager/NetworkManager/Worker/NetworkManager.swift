//
//  NetworkManager.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func getScienceNews() async -> Result<[ScienceNewsModel], RequestError>
}

class NetworkManager: NetworkManagerProtocol {
    private let router = Router<NetworkEndpoint>()
    
    func getScienceNews() async -> Result<[ScienceNewsModel], RequestError> {
        return await router.sendRequest(endpoint: .getScienseNews,
                                        responseModel: [ScienceNewsModel].self)
    }
}
