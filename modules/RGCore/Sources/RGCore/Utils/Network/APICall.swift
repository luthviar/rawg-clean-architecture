//
//  APICall.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import Foundation

struct API {
    static let baseUrlRawg = "https://api.rawg.io/api/"
    static let apiKeyRawg = "?key=160dc932a07e4f1dbe5cf3e6d7abc0ee"
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    
    enum Gets: Endpoint {
        case games
        
        public var url: String {
            switch self {
            case .games: return "\(API.baseUrlRawg)games\(API.apiKeyRawg)&page_size=50"
            }
        }
    }
    
}
