//
//  ScienceNewsTVC.swift
//  VIPER_Example
//
//  Created by Marat on 28.12.2022.
//

import UIKit
import SDWebImage

class ScienceNewsTVC: UITableViewCell {

    // MARK: - Views
    
    private let sciencePosterImage: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let titleLabel: UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.textAlignment = .left
        view.adjustsFontSizeToFitWidth = true
        view.numberOfLines = 0
        return view
    }()
    
    //MARK: - OVERRIDE FUNCS
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        settings()
       createAnchors()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       // createAnchors()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        sciencePosterImage.sd_cancelCurrentImageLoad()
        sciencePosterImage.image = nil
    }
    
    func setData(image url: String, text: String) {
        if let url = URL(string: url) {
            sciencePosterImage.sd_setImage(with: url)
        }
        titleLabel.text = text
    }
    //MARK: - SETTING FUNCS
    private func createAnchors() {
        sciencePosterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
       // sciencePosterImage.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        sciencePosterImage.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant: 10).isActive = true
      //  sciencePosterImage.widthAnchor.constraint(equalToConstant:100).isActive = true
       // sciencePosterImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        sciencePosterImage.rightAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        sciencePosterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: sciencePosterImage.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: sciencePosterImage.rightAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: sciencePosterImage.bottomAnchor),
        ])
    }
    
    private func settings() {
        contentView.addSubview(sciencePosterImage)
        contentView.addSubview(titleLabel)
    }
    
    //MARK: - CONSTANTS
    private enum ViewSizeConstants {
        
    }
}
