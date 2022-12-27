//
//  NewsInteractor.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

protocol NewsInteractorProtocol: AnyObject {
    var presenter: NewsInteractorToPresenterProtocol? {get set}
    
    func getScienceNews()
}

final class NewsInteractor: NewsInteractorProtocol {
    weak var presenter: NewsInteractorToPresenterProtocol?
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getScienceNews() {
        Task.init(priority: .high) {
            let value = await networkManager.getScienceNews()
            
            presenter?.listOfScienceNews(value)
        }
    }
}
