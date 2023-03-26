//
//  DetailInteractor.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation
import Combine

public protocol DetailUseCase {
    func getGame() -> GameModel
    func addToFavorite(game: GameModel) -> AnyPublisher<Bool, Error>
    func deleteFavorite(from game: GameModel) -> AnyPublisher<Bool, Error>
    func isInFavorite(idGame: Int) -> AnyPublisher<Bool, Error>
}

public class DetailInteractor: DetailUseCase {
    
    private let repository: GameRepositoryProtocol
    private let game: GameModel
    
    public required init(
        repository: GameRepositoryProtocol,
        game: GameModel
    ) {
        self.repository = repository
        self.game = game
    }
    
    public func getGame() -> GameModel {
        return game
    }
    
    public func addToFavorite(game: GameModel) -> AnyPublisher<Bool, Error> {
        return repository.addToFavorite(game: game)
    }
    
    public func deleteFavorite(from game: GameModel) -> AnyPublisher<Bool, Error> {
        return repository.deleteFavorite(from: game)
    }
    
    public func isInFavorite(idGame: Int) -> AnyPublisher<Bool, Error> {
        return repository.isInFavorite(idGame: idGame)
    }
    
}
