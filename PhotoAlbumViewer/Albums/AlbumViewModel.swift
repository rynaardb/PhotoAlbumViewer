//
//  AlbumViewController.swift
//  AlbumViewModel.swift
//
//  Created by Rynaard Burger on 29.04.19.
//  Copyright © 2019 Rynaard Burger. All rights reserved.
//

import Foundation

struct AlbumViewModel {
    private let model: Album!

    var title: String {
        return model.title
    }

    var numberOfPhotosString: String {
        return "Photos: 0"
    }

    init(model: Album) {
        self.model = model
    }
}
