import Cartography
import RiveRuntime
import UIKit

private extension RiveChallengeViewController.Size {
    static let buttonSize: CGSize = .init(width: 236, height: 64)
}

final class RiveChallengeViewController: UIViewController {
    // MARK: - Property(ies).
    fileprivate enum Size {}
    private let riveButton = RiveViewModel(fileName: "simple-button")
    
    // MARK: - Component(s).
    private lazy var button: RiveView = {
        let view = riveButton.createRiveView()
        view.addSubview(label)
        view.frame.size = Size.buttonSize
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.text = "Devpass"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Override(s).
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - ViewCodable.
extension RiveChallengeViewController: ViewCodable {
    func setupSubviews() {
        view.addSubview(button)
    }
    
    func setupConstraints() {
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        label.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
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
