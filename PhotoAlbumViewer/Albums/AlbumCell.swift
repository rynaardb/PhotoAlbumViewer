//
//  AlbumViewController.swift
//  AlbumCell.swift
//
//  Created by Rynaard Burger on 29.04.19.
//  Copyright © 2019 Rynaard Burger. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    public var viewModel: AlbumViewModel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.contentView.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
