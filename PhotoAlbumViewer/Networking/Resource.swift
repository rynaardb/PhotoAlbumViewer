//  Resource.swift

import Foundation

struct Resource<T> where T: Decodable {
    let path: String
    let queryItems: [URLQueryItem]?
    let parse: (Data) -> T? = { data in
        return try? JSONDecoder().decode(T.self, from: data)
    }

    init(path: String, queryItems: [URLQueryItem]? = nil) {
        self.path = path
        self.queryItems = queryItems
    }
}
