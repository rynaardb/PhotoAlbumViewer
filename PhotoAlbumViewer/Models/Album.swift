//
//  Album.swift
//  PhotoAlbumViewer
//
//  Created by Rynaard Burger on 29.04.19.
//  Copyright © 2019 Rynaard Burger. All rights reserved.
//

import Foundation

struct Album: Codable {
    let id: Int
    let userId: Int
    let title: String
}
