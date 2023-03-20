//
//  DetailInteractor.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation
import Combine

protocol DetailUseCase {    
    func getGame() -> GameModel
    func addToFavorite(game: GameModel) -> AnyPublisher<Bool, Error>
    func deleteFavorite(gameToDelete: GameModel, currentGames: [GameModel]) -> AnyPublisher<[GameModel], Error>
}

class DetailInteractor: DetailUseCase {
            
    private let repository: GameRepositoryProtocol
    private let game: GameModel
    
    required init(
        repository: GameRepositoryProtocol,
        game: GameModel
    ) {
        self.repository = repository
        self.game = game
    }
    
    func getGame() -> GameModel {
        return game
    }
    
    func addToFavorite(game: GameModel) -> AnyPublisher<Bool, Error> {
        return repository.addToFavorite(game: game)
    }
    
    func deleteFavorite(gameToDelete: GameModel, currentGames: [GameModel]) -> AnyPublisher<[GameModel], Error> {
        return repository.deleteFavorite(gameToDelete: gameToDelete, currentGames: currentGames)
    }
}
