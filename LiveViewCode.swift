import UIKit
import PlaygroundSupport

class TestView: UIView, ViewCodeProtocol {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - components
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.tintColor = .black
        btn.backgroundColor = .systemBlue
        return btn
    }()
    
    // MARK: - ViewCodeProtocol
    func buildViewHierachy() {
        addSubview(button)
    }
    
    func setupConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func addictionalConfiguration() {
        backgroundColor = .systemGray
    }
    
}

// MARK: - Live
var sizeScreen = ScreenSize.iphone4

let view = TestView(frame: sizeScreen.screen)
view.setupView()
PlaygroundPage.current.liveView = view

// MARK: - Protocol
protocol ViewCodeProtocol: UIView {
    func buildViewHierachy()
    func setupConstraints()
    func addictionalConfiguration()
}
// MARK: - Template Method
extension ViewCodeProtocol {
    func setupView() {
        buildViewHierachy()
        setupConstraints()
        addictionalConfiguration()
    }
}

enum ScreenSize {
    case iphone4
    case iphone5
    
    var screen: CGRect {
        switch self {
        case .iphone4:
            return CGRect(x: 0, y: 0, width: 320, height: 480)
        case .iphone5:
            return CGRect(x: 0, y: 0, width: 320, height: 520)
        }
    }
}
