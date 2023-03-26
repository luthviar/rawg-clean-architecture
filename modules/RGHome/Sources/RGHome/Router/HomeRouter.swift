//
//  HomeRouter.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI
import RGCore
import RGAbout
import RGDetail
import RGFavorite

public class HomeRouter {
    
    public func makeDetailView(for game: GameModel) -> some View {
        let detailUseCase = CoreInjection.init().provideDetail(game: game)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView()
            .environmentObject(presenter)
    }
    
    public func makeAboutView() -> some View {
        return AboutView()
    }
    
    public func makeFavoriteView() -> some View {
        let favUseCase = CoreInjection.init().provideFavorite()
        let presenter = FavoritePresenter(favUseCase: favUseCase)
        return FavoriteView()
            .environmentObject(presenter)
    }
    
}
