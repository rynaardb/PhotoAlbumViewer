// PhotoCell.swift

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {
    public var viewModel: PhotoViewModel! {
        didSet {
            prepareLayout()
        }
    }

    var imageView: UIImageView!
    var titleLabel: UILabel!

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle

    override func prepareForReuse() {
        self.contentView.backgroundColor = .lightGray
        imageView = nil
        titleLabel.text = nil
    }

    // MARK: Private

    private func prepareLayout() {
        let options: KingfisherOptionsInfo = [.transition(.fade(0.5))]
        imageView = UIImageView()
        imageView.kf.setImage(with: viewModel.thumbnailURL, options: options)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(imageView)

        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)])

        let overlayView = UIView()
        overlayView.backgroundColor = .black
        overlayView.layer.opacity = 0.5
        overlayView.translatesAutoresizingMaskIntoConstraints = false

        imageView.addSubview(overlayView)

        NSLayoutConstraint.activate([overlayView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
                                     overlayView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
                                     overlayView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
                                     overlayView.heightAnchor.constraint(equalToConstant: 60.0)])

        titleLabel = UILabel()
        titleLabel.text = viewModel.title
        titleLabel.numberOfLines = 4
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 11)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        overlayView.addSubview(titleLabel)

        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 2.0),
                                     titleLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -2.0),
                                     titleLabel.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 2.0),
                                     titleLabel.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor)])
    }
}
