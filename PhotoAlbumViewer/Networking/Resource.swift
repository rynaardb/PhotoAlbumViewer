//  Resource.swift

import Foundation

struct Resource<T> where T: Decodable {
    let path: String
    let parse: (Data) -> T? = { data in
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
