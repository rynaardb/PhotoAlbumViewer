//
//  Photo.swift
//  PhotoAlbumViewer
//
//  Created by Rynaard Burger on 29.04.19.
//  Copyright © 2019 Rynaard Burger. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    let album: Album
}
