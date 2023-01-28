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
                      forCellReuseIdentifier: ViewStringConstants.tableID)
        view.backgroundColor = .white
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    //MARK: - OVERRIDE FUNCS
    
    override func loadView() {
        super.loadView()
        settings()
        view.backgroundColor = .white
        presenter.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        navigationItem.title = ViewStringConstants.scienceTitle
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
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
            scienceNewsTable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            scienceNewsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private enum ViewStringConstants {
        static let tableID: String = "ScienceTableID"
        static let scienceTitle: String = "Space news"
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: ViewStringConstants.tableID,
                                                    for: indexPath) as? ScienceNewsTVC {
            let data = presenter.getRowInfo(row: indexPath.row)
                cell.setData(image: data.imageURL,
                             text: data.newsTitle)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 8

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 120
    }
    
}
