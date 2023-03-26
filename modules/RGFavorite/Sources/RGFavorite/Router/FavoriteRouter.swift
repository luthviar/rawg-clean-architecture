//
//  FavoriteRouter.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 24/03/23.
//

import SwiftUI
import RGCore
import RGDetail

public class FavoriteRouter {
    
    public func makeDetailView(for game: GameModel) -> some View {
        let detailUseCase = CoreInjection.init().provideDetail(game: game)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        presenter.isFavoriteMode = true
        return DetailView()
            .environmentObject(presenter)
    }
    
}

