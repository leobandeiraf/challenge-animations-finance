import Cartography
import RiveRuntime
import UIKit

final class RiveIntroductionViewController: UIViewController {
    // MARK: - Property(ies).
    private let riveViewModel = RiveViewModel(fileName: "3321-6973-string-demo")
    
    // MARK: - Override(s).
    override func loadView() {
        super.loadView()
        let riveView = riveViewModel.createRiveView()
        view = riveView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - ViewCodable.
extension RiveIntroductionViewController: ViewCodable {
    func setupSubviews() {}
    
    func setupConstraints() {}
    
    func setupExtraConfiguration() {
        view.backgroundColor = .systemBackground
    }
}

// MARK: - ShowcaseRow.
struct RiveIntroductionShowcase: ShowcaseRow {
    var title: String {
        "Introdução ao Rive"
    }
    
    var description: String {
        "Vamos ver como implementar e como alterar estados de uma animação Rive"
    }
    
    var destination: UIViewController {
        let vc = RiveIntroductionViewController()
        vc.title = title
        return vc
    }
}
