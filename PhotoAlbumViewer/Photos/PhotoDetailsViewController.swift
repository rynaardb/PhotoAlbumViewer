// PhotoDetailsViewController.swift

import UIKit
import Kingfisher

fileprivate var imageView: UIImageView!
fileprivate var scrollView: UIScrollView!

class PhotoDetailsViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    private var viewModel: PhotoViewModel!

    // MARK: Initializers

    init(viewModel: PhotoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = viewModel.photoIdString
        self.view.backgroundColor = UIColor(hue: 0.63, saturation: 0.09, brightness: 0.19, alpha: 1.00)

        prepareLayout()
    }

    // MARK: Private

    private func prepareLayout() {
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(scrollView)

        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10.0),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])

        let options: KingfisherOptionsInfo = [.transition(.fade(0.5))]
        imageView = UIImageView()
        imageView.kf.setImage(with: viewModel.imageURL, options: options)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        scrollView.addSubview(imageView)

        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)])
    }
}

extension PhotoDetailsViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
