//
//  GamesResponse.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation

struct GamesResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
        case description = "description"
    }
    let count: Int?
    let next: String?
    let previous: String?
    let results: [GameResponse]
    let description: String?
}

struct GameResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case slug = "slug"
        case name = "name"
        case released = "released"
        case backgroundImage = "background_image"
        case rating = "rating"
        case ratingTop = "rating_top"
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
        case updated = "updated"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case genres = "genres"
    }
    let id: Int?
    let slug: String?
    let name: String?
    let released: String?
    let backgroundImage: String?
    let rating: Float?
    let ratingTop: Int?
    let ratingsCount: Int?
    let reviewsTextCount: Int?
    let updated: String?
    let reviewsCount: Int?
    let saturatedColor: String?
    let dominantColor: String?
    let genres: [GenresResponse]?
}

struct GenresResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
    let id: Int?
    let name: String?
    let slug: String?
    let gamesCount: Int?
    let imageBackground: String?
}

