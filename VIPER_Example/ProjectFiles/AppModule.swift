//
//  AppModule.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import UIKit

protocol AppModule {
    func assembly() -> UIViewController?
}

protocol ModuleFactoryProtocol {
    func makeNewsScreen(using navigationController: UINavigationController) -> NewsModule
}

struct ModuleFactory: ModuleFactoryProtocol {
    //private let networkManager: NetworkManagerProtocol = NetworkManager()
    
    func makeNewsScreen(using navigationController: UINavigationController) -> NewsModule {
        let router = NewsRouter(navigationController: navigationController, moduleFactory: self)
        let view = NewsView()
        let interactor = NewsInteractor()
        return NewsModule(view: view, interactor: interactor, router: router)
    }
}
