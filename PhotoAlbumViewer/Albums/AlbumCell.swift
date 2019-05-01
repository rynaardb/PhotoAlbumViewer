//  AlbumViewController.swift

import UIKit
import Kingfisher

class AlbumCell: UICollectionViewCell {
    public var viewModel: AlbumViewModel! {
        didSet {
            updateViews()
        }
    }

    let options: KingfisherOptionsInfo = [.transition(.fade(0.5))]

    var overlayView: UIView!
    var titleLabel: UILabel!
    var stackView: UIStackView!
    var previewImageViews = [UIImageView]()

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.contentView.backgroundColor = UIColor(hue: 0.58, saturation: 0.12, brightness: 0.14, alpha: 1.00)

        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.opacity = 0.5

        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = nil

        for i in 0...2 {
            previewImageViews[i].image = nil
        }
    }

    // MARK: Private

    private func addSubviews() {
        // Preview image views
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(stackView)

        for _ in 0...2 {
            let imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
            previewImageViews.append(imageView)
            stackView.addArrangedSubview(imageView)
        }

        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     stackView.heightAnchor.constraint(equalToConstant: 50)])

        // Overlay view
        overlayView = UIView()
        overlayView.backgroundColor = .black
        overlayView.layer.opacity = 0.5
        overlayView.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(overlayView)

        NSLayoutConstraint.activate([overlayView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     overlayView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     overlayView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
                                     overlayView.heightAnchor.constraint(equalToConstant: 60.0)])

        // Title label
        titleLabel = UILabel()
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 11)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        overlayView.addSubview(titleLabel)

        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 2.0),
                                     titleLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -2.0),
                                     titleLabel.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 10.0),
                                     titleLabel.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor)])
    }

    private func updateViews() {
        if let previewPhotos = viewModel.previewPhotos {
            var index = 0

            for photo in previewPhotos {
                previewImageViews[index].kf.setImage(with: URL(string: photo.thumbnailUrl)!, options: options)
                index += 1
            }
        }

        titleLabel.text = viewModel.numberOfPhotosString
    }
}
