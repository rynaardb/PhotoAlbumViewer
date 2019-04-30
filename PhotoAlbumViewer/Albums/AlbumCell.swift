//  AlbumViewController.swift

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
