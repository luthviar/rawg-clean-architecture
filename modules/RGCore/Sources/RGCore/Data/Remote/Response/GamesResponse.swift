//
//  GamesResponse.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation

struct GamesResponse: Decodable, Encodable {
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
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(count, forKey: .count)
        try container.encode(next, forKey: .next)
        try container.encode(previous, forKey: .previous)
        try container.encode(results, forKey: .results)
        try container.encode(description, forKey: .description)
    }
}

struct GameResponse: Decodable, Encodable {
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
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(slug, forKey: .slug)
        try container.encode(name, forKey: .name)
        try container.encode(released, forKey: .released)
        try container.encode(backgroundImage, forKey: .backgroundImage)
        try container.encode(rating, forKey: .rating)
        try container.encode(ratingTop, forKey: .ratingTop)
        try container.encode(ratingsCount, forKey: .ratingsCount)
        try container.encode(reviewsTextCount, forKey: .reviewsTextCount)
        try container.encode(updated, forKey: .updated)
        try container.encode(reviewsCount, forKey: .reviewsCount)
        try container.encode(saturatedColor, forKey: .saturatedColor)
        try container.encode(dominantColor, forKey: .dominantColor)
        try container.encode(genres, forKey: .genres)
    }
}

struct GenresResponse: Decodable, Encodable {
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

extension GameResponse {
    static func fake() -> Self {
        return GameResponse(id: 0, slug: "", name: "", released: "", backgroundImage: "", rating: 0, ratingTop: 0, ratingsCount: 0, reviewsTextCount: 0, updated: "", reviewsCount: 0, saturatedColor: "", dominantColor: "", genres: [])
    }
}
