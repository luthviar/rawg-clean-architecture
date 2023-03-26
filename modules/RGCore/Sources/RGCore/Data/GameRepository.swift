//
//  GameRepository.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation
import Combine

public protocol GameRepositoryProtocol {
    func getGames() -> AnyPublisher<[GameModel], Error>
    
    func addToFavorite(game: GameModel) -> AnyPublisher<Bool, Error>
    func deleteFavorite(from game: GameModel) -> AnyPublisher<Bool, Error>
    func getFavorites() -> AnyPublisher<[GameModel], Error>
    func isInFavorite(idGame: Int) -> AnyPublisher<Bool, Error>
}

public final class GameRepository: NSObject {
    
    typealias GameInstance = (LocaleDataSource, RemoteDataSource) -> GameRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(locale: LocaleDataSource, remote: RemoteDataSource) {
        self.locale = locale
        self.remote = remote
    }
    
    static let sharedInstance: GameInstance = { localeRepo, remoteRepo in
        return GameRepository(locale: localeRepo, remote: remoteRepo)
    }
    
}

extension GameRepository: GameRepositoryProtocol {
    
    public func isInFavorite(idGame: Int) -> AnyPublisher<Bool, Error> {
        return self.locale.isInFavorite(idGame: idGame)
    }
    
    public func deleteFavorite(from game: GameModel) -> AnyPublisher<Bool, Error> {
        return self.locale.deleteFavorite(from: GameMapper.mapGameModelToGameFavoriteEntity(input: game))
    }
    
    public func addToFavorite(game: GameModel) -> AnyPublisher<Bool, Error> {
        return self.locale.addToFavorite(game: GameMapper.mapGameModelToGameFavoriteEntity(input: game))
    }
    
    public func getFavorites() -> AnyPublisher<[GameModel], Error> {
        return self.locale.getFavorites()
            .flatMap { result -> AnyPublisher<[GameModel], Error> in
                return self.locale.getFavorites()
                    .map { GameMapper.mapFavoriteGameEntitiesToDomains(input: $0) }
                    .eraseToAnyPublisher()
            }.eraseToAnyPublisher()
    }
    
    public func getGames() -> AnyPublisher<[GameModel], Error> {
        return self.locale.getGames()
            .flatMap { result -> AnyPublisher<[GameModel], Error> in
                if result.isEmpty {
                    return self.remote.getGames()
                        .map { GameMapper.mapGameResponsesToEntities(input: $0) }
                        .flatMap {
                            self.locale.addGames(from: $0)
                        }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getGames()
                                .map { GameMapper.mapGameEntitiesToDomains(input: $0) }
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.locale.getGames()
                        .map { GameMapper.mapGameEntitiesToDomains(input: $0) }
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}

