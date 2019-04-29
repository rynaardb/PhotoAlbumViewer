//
//  Resource.swift
//  PhotoAlbumViewer
//
//  Created by Rynaard Burger on 29.04.19.
//  Copyright © 2019 Rynaard Burger. All rights reserved.

import Foundation

struct Resource<T> where T: Decodable {
    let path: String
    let parse: (Data) -> T? = { data in
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
