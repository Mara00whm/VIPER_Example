//
//  NewsInteractor.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import Foundation

protocol NewsInteractorProtocol: AnyObject {
    var presenter: NewsInteractorToPresenterProtocol? {get set}
}

final class NewsInteractor: NewsInteractorProtocol {
    weak var presenter: NewsInteractorToPresenterProtocol?
}
