//
//  NewsView.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import UIKit

protocol NewsViewProtocol: AnyObject {
    var presenter: NewsPresenterToViewProtocol {get set}
    
}

final class NewsView: UIViewController {

    var presenter: NewsPresenterToViewProtocol = NewsPresenter()

    //MARK: - VIEWS
    
    //MARK: - OVERRIDE FUNCS
    
    override func loadView() {
        super.loadView()
        settings()
        view.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createAnchors()
    }
    
    //MARK: - SETTING FUNCS
    
    private func settings() {
        
    }
    
    private func createAnchors(){
        
    }
}

extension NewsView: NewsViewProtocol {
    
}
