//
//  CoreInjection.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation
import RealmSwift

public final class CoreInjection: NSObject {
    
    public func provideRepository() -> GameRepositoryProtocol {
        let realm = try? Realm()
        
        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        
        return GameRepository.sharedInstance(locale, remote)
    }
    
    public func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    public func provideDetail(game: GameModel) -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository, game: game)
    }
    
    public func provideFavorite() -> FavoriteUseCase {
        let repository = provideRepository()
        return FavoriteInteractor(repository: repository)
    }
    
}
