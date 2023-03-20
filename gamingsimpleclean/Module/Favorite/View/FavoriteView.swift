//
//  FavoriteView.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter
    
    var body: some View {
        ZStack {
            if presenter.loadingState {
                VStack {
                    Text("Loading...")
                    ProgressView()
                }
            } else {
                VStack {
                    List(self.presenter.favGames) { favGame in
                        self.presenter.linkBuilder(for: favGame) {
                            GameRow(game: favGame)
                        }
                    }
                }
            }
        }
        .onAppear {
            self.presenter.getFavGames()            
        }
        .navigationBarTitle(
            Text("Favorite Games"),
            displayMode: .automatic
        )

    }

}
