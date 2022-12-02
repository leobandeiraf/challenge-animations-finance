import Cartography
import Lottie
import UIKit

final class LottieChallengeViewController: UIViewController {
    // MARK: - Component(s).
    private lazy var allAnimation: LottieAnimationView = {
        let animation = LottieAnimationView(name: "All")
        animation.animationSpeed = 1.2
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .playOnce
        animation.play(toProgress: 0)
        return animation
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        [male1Button, femaleButton, male2Button].forEach { stackView.addArrangedSubview($0) }
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var male1Button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handler), for: .touchUpInside)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 8
        button.setTitle("Male 1", for: .normal)
        button.tag = 0
        button.tintColor = .white
        return button
    }()
    
    private lazy var femaleButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handler), for: .touchUpInside)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 8
        button.setTitle("Female 1", for: .normal)
        button.tag = 1
        button.tintColor = .white
        return button
    }()
    
    private lazy var male2Button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handler), for: .touchUpInside)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 8
        button.setTitle("Male 2", for: .normal)
        button.tag = 2
        button.tintColor = .white
        return button
    }()
    
    // MARK: - Override(s).
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension LottieChallengeViewController {
    // MARK: - Method(s).
    @objc private func handler(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            allAnimation.play(toProgress: 0)
            UIView.animate(withDuration: 1.173, delay: 0) {
                self.view.backgroundColor = UIColor(red: 0.41, green: 0.88, blue: 0.83, alpha: 1.00)
            }
        case 1:
            allAnimation.play(toProgress: 0.35)
            UIView.animate(withDuration: 1.173, delay: 0) {
                self.view.backgroundColor = UIColor(red: 0.87, green: 0.54, blue: 0.80, alpha: 1.00)
            }
        default:
            allAnimation.play(toProgress: 0.75)
            UIView.animate(withDuration: 1.173, delay: 0) {
                self.view.backgroundColor = UIColor(red: 0.87, green: 0.88, blue: 0.41, alpha: 1.00)
            }
        }
    }
}

// MARK: - ViewCodable.
extension LottieChallengeViewController: ViewCodable {
    func setupSubviews() {
        [allAnimation, stackView].forEach { view.addSubview($0) }
    }
    
    func setupConstraints() {
        constrain(allAnimation, view) {
            $0.edges == $1.edges
        }
        
        constrain(stackView) {
            $0.leading == $0.superview!.leading + 16
            $0.bottomMargin == $0.superview!.bottomMargin - 16
            $0.trailing == $0.superview!.trailing - 16
        }
        
        [male1Button, femaleButton, male2Button].forEach {
            constrain($0) {
                $0.height == 50
            }
        }
    }
    
    func setupExtraConfiguration() {
        view.backgroundColor = UIColor(red: 0.41, green: 0.88, blue: 0.83, alpha: 1.00)
    }
}

// MARK: - ShowcaseRow.
struct LottieChallengeShowcase: ShowcaseRow {
    var title: String {
        "Lottie Challenge 🏆"
    }
    
    var description: String {
        "Coloque os conhecimentos em prática nesse desafio de Lottie!"
    }
    
    var destination: UIViewController {
        let vc = LottieChallengeViewController()
        vc.title = title
        return vc
    }
}
