//
//  AppLoader.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import UIKit

struct AppLoader {
    private let window: UIWindow
    private let navigationController: UINavigationController
    //private let moduleFactory: ModuleFactoryProtocol
    
    init(
        window: UIWindow = UIWindow(frame: UIScreen.main.bounds),
        navigationController: UINavigationController = UINavigationController()
        //,moduleFactory: ModuleFactoryProtocol = ModuleFactory()
    ) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func builHomeView() -> UIViewController {
        
        return UIViewController()
    }
}
