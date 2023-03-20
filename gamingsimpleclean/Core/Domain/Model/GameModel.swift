//
//  GameModel.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation

struct GameModel: Equatable, Identifiable {
    let id: Int
    let name: String
    let rating: Float
    let ratingsCount: Int
    let backgroundImage: String
    let released: String        
    let slug: String
    let reviewsCount: Int
    let saturatedColor: String
    let dominantColor: String
    let genres: String
}
