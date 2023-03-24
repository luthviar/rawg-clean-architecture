//
//  GameModel.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation

public struct GameModel: Equatable, Identifiable {
    public let id: Int
    public let name: String
    public let rating: Float
    public let ratingsCount: Int
    public let backgroundImage: String
    public let released: String
    public let slug: String
    public let reviewsCount: Int
    public let saturatedColor: String
    public let dominantColor: String
    public let genres: String
}
