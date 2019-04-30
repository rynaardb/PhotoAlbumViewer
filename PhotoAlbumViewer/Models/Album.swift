//
//  Album.swift
//  PhotoAlbumViewer
//
//  Created by Rynaard Burger on 29.04.19.
//  Copyright © 2019 Rynaard Burger. All rights reserved.
//

import Foundation

struct Album: Decodable {
    let id: Int
    let userId: Int
    let title: String
}

extension Album {
    static func allAlbums() -> Resource<[Album]> {
        return Resource<[Album]>(path: "/albums")
    }

    static func albumsForUser(userId: Int) -> Resource<[Album]> {
        return Resource<[Album]>(path: "/albums?userId=\(userId)")
    }
}
