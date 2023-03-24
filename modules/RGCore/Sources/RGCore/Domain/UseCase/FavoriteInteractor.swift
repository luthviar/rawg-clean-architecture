//
//  FavoriteInteractor.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation
import Combine

public protocol FavoriteUseCase {
    func getFavorites() -> AnyPublisher<[GameModel], Error>
}

public class FavoriteInteractor: FavoriteUseCase {
    
    private let repository: GameRepositoryProtocol
    
    public required init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getFavorites() -> AnyPublisher<[GameModel], Error> {
        return self.repository.getFavorites()
    }
    
}

