//
//  GameRow.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI
import CachedAsyncImage
import RGCore

public struct GameRow: View {
    
    public var game: GameModel
    
    public init(game: GameModel) {
        self.game = game
    }
    
    public var body: some View {
        HStack {
            AsyncImage(url: URL(string: game.backgroundImage)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(
                            width: 80,
                            height: 80
                        )
                        .cornerRadius(8)
                        .scaledToFit()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: 80,
                            height: 80
                        )
                        .background(Color.black)
                        .cornerRadius(20)
                        .padding(.trailing, 4)
                case .failure:
                    Image(systemName: "exclamationmark.icloud.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: 80,
                            height: 80
                        )
                        .background(Color.black)
                        .cornerRadius(20)
                        .padding(.trailing, 4)
                @unknown default:
                    fatalError()
                }
            }
            VStack(alignment: .leading, spacing: 8.0) {
                Text(game.name)
                    .font(.system(size: 25, weight: .bold))
            }
        }
    }
    
}

extension GameRow {
    
    public var imageGame: some View {
        CachedAsyncImage(url: URL(string: game.backgroundImage)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }.cornerRadius(30).scaledToFit().frame(width: 200).padding(.top)
    }
    
    public var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(game.name)
                .font(.title)
                .bold()
            HStack(spacing: 2) {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.yellow)
                Text("\(Utils.roundToOneDecimal(game.rating))")
                    .font(.system(size: 13))
                Text("(\(game.ratingsCount))")
                    .foregroundColor(.gray)
                    .font(.system(size: 13))
            }
            
        }.padding(
            EdgeInsets(
                top: 0,
                leading: 16,
                bottom: 16,
                trailing: 16
            )
        )
    }
    
}
