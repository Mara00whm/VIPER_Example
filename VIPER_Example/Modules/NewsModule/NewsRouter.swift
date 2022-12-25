//
//  NewsRouter.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation
import UIKit

protocol NewsRouterProtocol {

}

final class NewsRouter: NewsRouterProtocol {
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
}
