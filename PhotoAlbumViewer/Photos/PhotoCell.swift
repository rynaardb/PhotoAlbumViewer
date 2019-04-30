// PhotoCell.swift

import UIKit

class PhotoCell: UICollectionViewCell {
    public var viewModel: PhotoViewModel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.contentView.backgroundColor = .blue
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
