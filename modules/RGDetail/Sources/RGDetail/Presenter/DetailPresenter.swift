//
//  DetailPresenter.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI
import Combine
import RGCore

public class DetailPresenter: ObservableObject {
    
    private let detailUseCase: DetailUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var game: GameModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    @Published var isDeletedFromFavorite: Bool = false
    @Published public var isFavoriteMode: Bool = false
    @Published var isInFavorite: Bool = false
    
    public init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
        game = detailUseCase.getGame()
    }
    
    public func addToFavorite() {
        detailUseCase.addToFavorite(game: self.game)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                    self.checkIsInFavorite()
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
    }
    
    public func deleteFromFavorite() {
        detailUseCase.deleteFavorite(from: self.game)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                    self.checkIsInFavorite()
                }
            }, receiveValue: { isDeleted in
                self.isDeletedFromFavorite = isDeleted
            })
            .store(in: &cancellables)
    }
    
    func checkIsInFavorite() {
        detailUseCase.isInFavorite(idGame: self.game.id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { isFavorited in
                self.isInFavorite = isFavorited
            })
            .store(in: &cancellables)
    }
}
