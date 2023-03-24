//
//  FavoriteRouter.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 24/03/23.
//

import SwiftUI

class FavoriteRouter {
    
    func makeDetailView(for game: GameModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(game: game)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        presenter.isFavoriteMode = true
        return DetailView(presenter: presenter)
    }
    
}

