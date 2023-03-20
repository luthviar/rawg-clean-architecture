//
//  GameEntity.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation
import RealmSwift

class GameEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var rating: Float = 0
    @objc dynamic var ratingsCount: Int = 0
    @objc dynamic var backgroundImage: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var slug: String = ""
    @objc dynamic var reviewsCount: Int = 0
    @objc dynamic var saturatedColor: String = ""
    @objc dynamic var dominantColor: String = ""
    @objc dynamic var genres: String = ""    
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

class GameFavoriteEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var rating: Float = 0
    @objc dynamic var ratingsCount: Int = 0
    @objc dynamic var backgroundImage: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var slug: String = ""
    @objc dynamic var reviewsCount: Int = 0
    @objc dynamic var saturatedColor: String = ""
    @objc dynamic var dominantColor: String = ""
    @objc dynamic var genres: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
