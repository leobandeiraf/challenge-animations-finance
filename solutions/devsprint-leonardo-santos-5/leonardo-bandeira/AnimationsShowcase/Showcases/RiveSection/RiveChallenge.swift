import Cartography
import RiveRuntime
import UIKit

private extension RiveChallengeViewController.Size {
    static let buttonSize: CGSize = .init(width: 236, height: 64)
}

final class RiveChallengeViewController: UIViewController {
    // MARK: - Property(ies).
    fileprivate enum Size {}
    private let riveViewModel = RiveViewModel(fileName: "simple-button")
    
    // MARK: - Component(s).
    private lazy var buttonView: UIView = {
        let view = UIView()
        view.addSubview(riveView)
        view.addSubview(button)
        view.frame.size = Size.buttonSize
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 16
        return view
    }()
    
    private lazy var riveView: RiveView = {
        let view = riveViewModel.createRiveView()
        view.frame.origin = .init(x: -118, y: 0)
        view.frame.size = Size.buttonSize
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handlerButton))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Override(s).
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension RiveChallengeViewController {
    // MARK: - Method(s).
    @objc
    private func handlerButton() {
        print("Clicou")
        riveViewModel.setInput("shouldTapped", value: true)
    }
}

// MARK: - ViewCodable.
extension RiveChallengeViewController: ViewCodable {
    func setupSubviews() {
        view.addSubview(buttonView)
    }
    
    func setupConstraints() {
        constrain(buttonView) {
            $0.center == $0.superview!.center
        }
        
        constrain(button, riveView) {
            $0.size == $1.size
        }
    }
    
    func setupExtraConfiguration() {
        view.backgroundColor = .white
    }
}

// MARK: - ShowcaseRow.
struct RiveChallengeShowcase: ShowcaseRow {
    var title: String {
        "Rive Challenge 🏆"
    }

    var description: String {
        "Aplique os seus conhecimentos de Rive"
    }

    var destination: UIViewController {
        let vc = RiveChallengeViewController()
        vc.title = title
        return vc
    }
}
