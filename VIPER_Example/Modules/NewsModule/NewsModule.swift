//
//  NewsModule.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation
import UIKit

final class NewsModule {
    private var view: NewsViewProtocol
    private var interactor: NewsInteractorProtocol
    private var presenter: NewsPresenterProtocol
    private var router: NewsRouterProtocol
    
    init(
        view: NewsViewProtocol = NewsView(),
        interactor: NewsInteractorProtocol = NewsInteractor(),
        presenter: NewsPresenterProtocol = NewsPresenter(),
        router: NewsRouterProtocol = NewsRouter()
    ) {
        self.presenter = presenter
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension NewsModule: AppModule {
    func assembly() -> UIViewController? {
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view as? UIViewController
    }
}
