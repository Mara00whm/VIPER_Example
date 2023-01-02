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

    func getRowInfo(row: Int) -> (imageURL: String, newsTitle: String)
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
    
    //MARK: - DI
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
    
    //MARK: - funcs
    func viewDidLoad() {
        DispatchQueue.global(qos: .utility).async {
            self.interactor.getScienceNews()
        }
    }
    
    var getNumberOfRows: Int = 0

    func getRowInfo(row: Int) -> (imageURL: String, newsTitle: String) {
        let imageURL = scienceNewsModel[row].imageUrl ?? ""
        let newsTitle = scienceNewsModel[row].title ?? ""
        return (imageURL, newsTitle)
    }
    
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
