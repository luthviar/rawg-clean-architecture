//
//  HomePresenter.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let router = HomeRouter()
    private let homeUseCase: HomeUseCase
    
    @Published var games: [GameModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    
    func getGames() {
        loadingState = true
        homeUseCase.getGames()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { games in
                self.games = games
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        for game: GameModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(for: game)
        ) { content() }
    }
    
    func linkBuilder<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeAboutView()
        ) { content() }
    }
    
    func linkBuilderToFavorite<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeFavoriteView()
        ) { content() }
    }
    
}
