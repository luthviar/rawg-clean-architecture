//
//  GameMapper.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation

final class GameMapper {
    
    static func mapGameResponsesToEntities(
        input gameResponses: [GameResponse]
    ) -> [GameEntity] {
        return gameResponses.map { result in
            let stringGenres: String = GameMapper.getStringGenres(result.genres)
            let newGame = GameEntity()
            newGame.id = result.id ?? 0
            newGame.name = result.name ?? "Unknown"
            newGame.rating = result.rating ?? 0
            newGame.ratingsCount = result.ratingsCount ?? 0
            newGame.backgroundImage = result.backgroundImage ?? "Unknown"
            newGame.released = result.released ?? "Unknown"
            newGame.slug = result.slug ?? "Unknown"
            newGame.reviewsCount = result.reviewsCount ?? 0
            newGame.saturatedColor = result.saturatedColor ?? "Unknown"
            newGame.dominantColor = result.dominantColor ?? "Unknown"
            newGame.genres = stringGenres
            return newGame
        }
    }    
    
    static func mapGameEntitiesToDomains(
        input gameEntities: [GameEntity]
    ) -> [GameModel] {
        return gameEntities.map { result in
            return GameModel(id: result.id, name: result.name, rating: result.rating, ratingsCount: result.ratingsCount, backgroundImage: result.backgroundImage, released: result.released, slug: result.slug, reviewsCount: result.reviewsCount, saturatedColor: result.saturatedColor, dominantColor: result.dominantColor, genres: result.genres)
        }
    }
    
    static func mapGameResponsesToDomains(
        input gameResponses: [GameResponse]
    ) -> [GameModel] {
        return gameResponses.map { result in
            let stringGenres: String = GameMapper.getStringGenres(result.genres)
            return GameModel(id: result.id ?? 0, name: result.name ?? "", rating: result.rating ?? 0, ratingsCount: result.ratingsCount ?? 0, backgroundImage: result.backgroundImage ?? "", released: result.released ?? "", slug: result.slug ?? "", reviewsCount: result.reviewsCount ?? 0, saturatedColor: result.saturatedColor ?? "", dominantColor: result.dominantColor ?? "", genres: stringGenres)
        }
    }
    
    static func getStringGenres(_ resultGenresResponse: [GenresResponse]?) -> String {
        var stringGenres: String = ""
        if let resultGenres = resultGenresResponse {
            for genre in resultGenres {
                stringGenres += " \(genre.name ?? "")"
            }
        }
        return stringGenres.isEmpty ? "Unknown" : stringGenres
    }
    
    static func mapFavoriteGameEntitiesToDomains(
        input gameEntities: [GameFavoriteEntity]
    ) -> [GameModel] {
        return gameEntities.map { result in
            return GameModel(id: result.id, name: result.name, rating: result.rating, ratingsCount: result.ratingsCount, backgroundImage: result.backgroundImage, released: result.released, slug: result.slug, reviewsCount: result.reviewsCount, saturatedColor: result.saturatedColor, dominantColor: result.dominantColor, genres: result.genres)
        }
    }
    
    static func mapGameModelToGameFavoriteEntity(
        input gameModel: GameModel
    ) -> GameFavoriteEntity {
        let result = gameModel
        let newGame = GameFavoriteEntity()
        newGame.id = result.id
        newGame.name = result.name
        newGame.rating = result.rating
        newGame.ratingsCount = result.ratingsCount
        newGame.backgroundImage = result.backgroundImage
        newGame.released = result.released
        newGame.slug = result.slug
        newGame.reviewsCount = result.reviewsCount
        newGame.saturatedColor = result.saturatedColor
        newGame.dominantColor = result.dominantColor
        newGame.genres = result.genres
        return newGame
    }
    
    static func mapGameModelToGameFavoriteEntities(
        input gameModels: [GameModel]
    ) -> [GameFavoriteEntity] {
        return gameModels.map { result in
            let stringGenres: String = result.genres
            let newGame = GameFavoriteEntity()
            newGame.id = result.id
            newGame.name = result.name
            newGame.rating = result.rating
            newGame.ratingsCount = result.ratingsCount
            newGame.backgroundImage = result.backgroundImage
            newGame.released = result.released
            newGame.slug = result.slug
            newGame.reviewsCount = result.reviewsCount
            newGame.saturatedColor = result.saturatedColor
            newGame.dominantColor = result.dominantColor
            newGame.genres = stringGenres
            return newGame
        }
    }
    
}

