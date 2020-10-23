import Foundation

protocol RenderViewProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalViewSetup()
}

extension RenderViewProtocol {
    func setupViews() {
        buildViewHierarchy()
        setupConstraints()
        additionalViewSetup()
    }
}
