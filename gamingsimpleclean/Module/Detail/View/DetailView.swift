//
//  File.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI
import CachedAsyncImage

struct DetailView: View {
    @ObservedObject var presenter: DetailPresenter
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            if presenter.loadingState {
                VStack {
                    Text("Loading...")
                    ProgressView()
                }
            } else {
                ScrollView(.vertical) {
                    VStack {
                        CachedAsyncImage(url: URL(string: self.presenter.game.backgroundImage)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }.scaledToFit().frame(width: 250.0, height: 250.0, alignment: .center)
                        
                        Spacer()
                        
                        Text(self.presenter.game.name)
                            .font(.headline)
                        
                        Text("\(self.presenter.game.slug)")
                            .font(.caption)
                        
                        Spacer()
                        
                        Text("\(self.presenter.game.genres)")
                            .font(.system(size: 15))
                                                
                        Spacer()
                        
                        Group {
                            Text("Release: \(Utils.getReleaseDate(self.presenter.game.released))")
                                .lineLimit(2)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            HStack(spacing: 2) {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.yellow)
                                Text("\(Utils.roundToOneDecimal(self.presenter.game.rating))")
                                    .font(.system(size: 13))
                                Text("(\(self.presenter.game.ratingsCount))")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13))
                            }
                            
                            HStack {
                                Text("Total Reviews: \(self.presenter.game.reviewsCount)")
                            }
                            
                            
                            Button {
                                if self.presenter.isFavoriteMode {
                                    self.presenter.deleteFromFavorite()
                                } else {
                                    self.presenter.addToFavorite()
                                }
                            } label: {
                                if self.presenter.isFavoriteMode {
                                    if self.presenter.isDeletedFromFavorite {
                                        Text("Succeed Deleted From Favorite")
                                    } else {
                                        Text("Delete From Favorite")
                                    }
                                } else {
                                    if self.presenter.isAddedToFavorite {
                                        Text("Succeed Added To Favorite")
                                    } else {
                                        Text("Add To Favorite")
                                    }
                                }
                            }

                        }
                                                
                    }.padding()
                }.onChange(of: self.presenter.isDeletedFromFavorite) { newValue in
                    if newValue {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                            self.presentationMode.wrappedValue.dismiss()
                        })
                    }
                }
            }
        }.navigationBarTitle(Text(self.presenter.game.name), displayMode: .large)
    }
}
