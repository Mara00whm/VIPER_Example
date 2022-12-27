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
    
    var getNumberOfRows: Int {get}
}

protocol NewsInteractorToPresenterProtocol: AnyObject {
    func listOfScienceNews(_ result: Result<[ScienceNewsModel], RequestError>)
}

typealias NewsPresenterProtocol = NewsPresenterSettingsProtocol & NewsPresenterToViewProtocol & NewsInteractorToPresenterProtocol

final class NewsPresenter: NewsPresenterProtocol {
    
    private var scienceNewsModel: [ScienceNewsModel] = [] {
        didSet {
            getNumberOfRows = scienceNewsModel.count
            view?.reloadTable()
        }
    }
    
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
        interactor.getScienceNews()
    }
    
    var getNumberOfRows: Int = 0

    func listOfScienceNews(_ result: Result<[ScienceNewsModel], RequestError>) {
        switch result {
        case .success(let model):
            scienceNewsModel = model
        case .failure(let val):
            print("n")
            //show alert later
        }
    }
    
}
