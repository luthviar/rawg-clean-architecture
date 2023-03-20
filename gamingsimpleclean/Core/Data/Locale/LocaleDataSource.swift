//
//  LocaleDataStore.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation
import RealmSwift
import Combine

protocol LocaleDataSourceProtocol: AnyObject {
    func getGames() -> AnyPublisher<[GameEntity], Error>
    func addGames(from games: [GameEntity]) -> AnyPublisher<Bool, Error>
    
    func addToFavorite(game: GameFavoriteEntity) -> AnyPublisher<Bool, Error>
    func deleteFavorite(gameToDelete: GameFavoriteEntity, currentGames: [GameFavoriteEntity]) -> AnyPublisher<[GameFavoriteEntity], Error>
    func getFavorites() -> AnyPublisher<[GameFavoriteEntity], Error>
}

final class LocaleDataSource: NSObject {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
        return LocaleDataSource(realm: realmDatabase)
    }
    
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    
    func getFavorites() -> AnyPublisher<[GameFavoriteEntity], Error> {
        return Future<[GameFavoriteEntity], Error> { completion in
            if let realm = self.realm {
                let games: Results<GameFavoriteEntity> = {
                    realm.objects(GameFavoriteEntity.self)
                        .sorted(byKeyPath: "id", ascending: true)
                }()
                completion(.success(games.toArray(ofType: GameFavoriteEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func deleteFavorite(gameToDelete: GameFavoriteEntity, currentGames: [GameFavoriteEntity]) -> AnyPublisher<[GameFavoriteEntity], Error> {
        return Future<[GameFavoriteEntity], Error> { completion in
            if let realm = self.realm, let offsets = currentGames.firstIndex(of: gameToDelete), let index = IndexSet(integer: offsets).first {
                do {
                    try realm.write {
                        var currentGamesEntity: [GameFavoriteEntity] = currentGames
                        let game = currentGamesEntity[index]
                        realm.delete(game)
                        currentGamesEntity.remove(at: index)
                        completion(.success(currentGamesEntity))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addToFavorite(game: GameFavoriteEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(game, update: .all)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getGames() -> AnyPublisher<[GameEntity], Error> {
        return Future<[GameEntity], Error> { completion in
            if let realm = self.realm {
                let games: Results<GameEntity> = {
                    realm.objects(GameEntity.self)
                        .sorted(byKeyPath: "id", ascending: true)
                }()
                completion(.success(games.toArray(ofType: GameEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addGames(from games: [GameEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for game in games {
                            realm.add(game, update: .all)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }        
    
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
    
}
