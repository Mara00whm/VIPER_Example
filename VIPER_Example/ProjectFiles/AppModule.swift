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
    func makeNewsScreen(using: UINavigationController) //-> NewsModule
}

struct ModuleFactory: ModuleFactoryProtocol {
    //private let networkManager: NetworkManagerProtocol = NetworkManager()
    
    func makeNewsScreen(using: UINavigationController) {
        // later!
    }
}
