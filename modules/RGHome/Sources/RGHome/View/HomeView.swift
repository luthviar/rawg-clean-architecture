//
//  HomeView.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI
import RGGameRow

public struct HomeView: View {
    
    @EnvironmentObject var presenter: HomePresenter
    
    public init() {}
    
    public var body: some View {
        ZStack {
            if presenter.loadingState {
                VStack {
                    Text("Loading...")
                    ProgressView()
                }
            } else {
                VStack {
                    List(self.presenter.games) { game in
                        self.presenter.linkBuilder(for: game) {
                            GameRow(game: game)
                        }
                    }
                }
            }
        }
        .onAppear {
            if self.presenter.games.count == 0 {
                self.presenter.getGames()
            }
        }
        .navigationBarTitle(
            Text("Gaming App"),
            displayMode: .automatic
        )
        .navigationBarItems(
            leading:
                self.presenter.linkBuilderToFavorite {
                    HStack {
                        Text("My Favorites")
                        Image(systemName: "star.fill")
                    }.foregroundColor(.orange)
                }
            ,
            trailing:
                self.presenter.linkBuilder{
                    HStack {
                        Image(systemName: "info.circle")
                    }
                }
        )
    }
    
}
