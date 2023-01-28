//
//  ScienceNewsModel.swift
//  VIPER_Example
//
//  Created by Marat on 28.12.2022.
//

import Foundation

struct ScienceNewsModel: Codable {
    let id: Int
    let title: String?
    let url: String?
    let imageUrl: String?
    let newsSite: String?
    let summary: String?
    let publishedAt: String?
}
