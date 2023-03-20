//
//  HomeRouter.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI

class HomeRouter {
    
    func makeDetailView(for game: GameModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(game: game)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
    
    func makeAboutView() -> some View {
        return AboutView()
    }
    
    func makeFavoriteView() -> some View {
        let favUseCase = Injection.init().provideFavorite()
        let presenter = FavoritePresenter(favUseCase: favUseCase)
        return FavoriteView(presenter: presenter)
    }
    
}
