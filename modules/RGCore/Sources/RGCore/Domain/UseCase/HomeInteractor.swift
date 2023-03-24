//
//  HomeInteractor.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation
import Combine

public protocol HomeUseCase {
    func getGames() -> AnyPublisher<[GameModel], Error>
}

public class HomeInteractor: HomeUseCase {
    
    private let repository: GameRepositoryProtocol
    
    public required init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getGames() -> AnyPublisher<[GameModel], Error> {
        return repository.getGames()
    }
    
}
