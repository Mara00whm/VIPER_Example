//
//  NewsPresenter.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

protocol NewsPresenterSettingsProtocol: AnyObject {
    var view: NewsViewProtocol? {get set}
    var interactor: NewsInteractorProtocol {get set}
    var router: NewsRouterProtocol {get set}
}

protocol NewsPresenterToViewProtocol {
    func viewDidLoad()
}

protocol NewsInteractorToPresenterProtocol: AnyObject {
    
}

typealias NewsPresenterProtocol = NewsPresenterSettingsProtocol & NewsPresenterToViewProtocol & NewsInteractorToPresenterProtocol

final class NewsPresenter: NewsPresenterProtocol {
    
    weak var view: NewsViewProtocol?
    
    var interactor: NewsInteractorProtocol
    
    var router: NewsRouterProtocol
    
    init(
        view: NewsViewProtocol? = nil,
        interactor: NewsInteractorProtocol = NewsInteractor(),
        router: NewsRouterProtocol = NewsRouter()
    ) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
    }
    
    
}
