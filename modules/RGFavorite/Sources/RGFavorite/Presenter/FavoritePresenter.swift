//
//  FavoritePresenter.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI
import Combine
import RGCore

public class FavoritePresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let router = FavoriteRouter()
    private let favUseCase: FavoriteUseCase
    
    @Published var favGames: [GameModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    public init(favUseCase: FavoriteUseCase) {
        self.favUseCase = favUseCase
    }
    
    public func getFavGames() {
        loadingState = true
        favUseCase.getFavorites()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { favGames in
                self.favGames = favGames
            })
            .store(in: &cancellables)
    }
    
    public func linkBuilder<Content: View>(
        for game: GameModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(for: game)
        ) { content() }
    }
    
}

