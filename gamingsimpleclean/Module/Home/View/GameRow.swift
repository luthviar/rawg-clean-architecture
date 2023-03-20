//
//  GameRow.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI
import CachedAsyncImage

struct GameRow: View {
    
    var game: GameModel
    var body: some View {
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
        
//        VStack {
//            imageGame
//            content
//        }
//        .frame(height: 250)
//        .padding([.leading, .trailing], 16)
//        .background(Color.random.opacity(0.3))
//        .cornerRadius(30)
    }
    
}

extension GameRow {
    
    var imageGame: some View {
        CachedAsyncImage(url: URL(string: game.backgroundImage)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }.cornerRadius(30).scaledToFit().frame(width: 200).padding(.top)
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(game.name)
                .font(.title)
                .bold()
            
//            Text("\(game.rating)")
//                .font(.system(size: 14))
//                .lineLimit(2)
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

struct GameRow_Previews: PreviewProvider {
    
    static var previews: some View {        
        let game = GameModel(id: 1, name: "GAME A", rating: 1.3, ratingsCount: 4, backgroundImage: "", released: "", slug: "", reviewsCount: 0, saturatedColor: "", dominantColor: "", genres: "")
        return GameRow(game: game)
    }
    
}
