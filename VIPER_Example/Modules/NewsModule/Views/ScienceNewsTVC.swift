//
//  ScienceNewsTVC.swift
//  VIPER_Example
//
//  Created by Marat on 28.12.2022.
//

import UIKit
import SDWebImage

class ScienceNewsTVC: UITableViewCell {
    
    private weak var imageOperation: SDWebImageDownloaderOperation?
    // MARK: - Views
    
    private let sciencePosterImage: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    //MARK: - OVERRIDE FUNCS
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        settings()
       // createAnchors()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createAnchors()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        sciencePosterImage.sd_cancelCurrentImageLoad()
        sciencePosterImage.image = nil
    }
    
    func setData(image url: String) {
        if let url = URL(string: url) {
            sciencePosterImage.sd_setImage(with: url)
        }
    }
    //MARK: - SETTING FUNCS
    private func createAnchors() {
        sciencePosterImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        sciencePosterImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        sciencePosterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        sciencePosterImage.widthAnchor.constraint(equalToConstant: 75).isActive = true
        sciencePosterImage.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    private func settings() {
        contentView.addSubview(sciencePosterImage)
    }
    
    //MARK: - CONSTANTS
    private enum ViewSizeConstants {
        
    }
}
