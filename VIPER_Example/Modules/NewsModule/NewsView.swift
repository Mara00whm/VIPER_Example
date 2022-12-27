//
//  NewsView.swift
//  VIPER_Example
//
//  Created by Marat on 24.12.2022.
//

import UIKit

protocol NewsViewProtocol: AnyObject {
    var presenter: NewsPresenterToViewProtocol {get set}
    
    func reloadTable()
}

final class NewsView: UIViewController {

    var presenter: NewsPresenterToViewProtocol = NewsPresenter()

    //MARK: - VIEWS
    
    private let scienceNewsTable: UITableView = {
       let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(ScienceNewsTVC.self,
                      forCellReuseIdentifier: "hop")
        return view
    }()
    
    //MARK: - OVERRIDE FUNCS
    
    override func loadView() {
        super.loadView()
        settings()
        view.backgroundColor = .red
        presenter.viewDidLoad()
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
        view.addSubview(scienceNewsTable)
        
        scienceNewsTable.delegate = self
        scienceNewsTable.dataSource = self
    }
    
    private func createAnchors(){
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            scienceNewsTable.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scienceNewsTable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            scienceNewsTable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -15),
            scienceNewsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension NewsView: NewsViewProtocol {
    func reloadTable() {
        DispatchQueue.main.async {
            self.scienceNewsTable.reloadData()
        }
    }
}

extension NewsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getNumberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "hop", for: indexPath) as? ScienceNewsTVC {
            cell.setData(image: "https://www.nasaspaceflight.com/wp-content/uploads/2022/12/Nilesat-301_Stephen2-1170x776.jpg")
            return cell
        }
        return UITableViewCell()
    }
    
    
}
