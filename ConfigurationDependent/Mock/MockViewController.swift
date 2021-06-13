//
//  MockViewController.swift
//  Random People
//
//  Created by Feridun Erbas on 13.06.2021.
//

import UIKit

class MockViewController: UIViewController {
    
    private lazy var bubbleView = makeBubbleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.bubbleTapped))
        bubbleView.addGestureRecognizer(gestureRecognizer)
    }
    
    func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        presentedViewController != nil || bubbleView.frame.contains(point)
    }
    
    @objc func bubbleTapped() {
        let vc = UINavigationController(rootViewController: MockListViewController())
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self.view) else { return }
        bubbleView.frame.origin.x = min(max(0, location.x - 25), UIScreen.main.bounds.width - 25)
        bubbleView.frame.origin.y = min(max(0, location.y - 25), UIScreen.main.bounds.height - 25)
    }
    
}

// MARK: - MockBubbleView
extension MockViewController {
    private func makeBubbleView() -> MockBubbleView {
        let bubbleView = MockBubbleView(frame: CGRect(origin: .init(x: 0, y: 100), size: .init(width: 40, height: 40)))
        bubbleView.backgroundColor = UIColor.systemRed
        bubbleView.layer.cornerRadius = 20
        bubbleView.layer.masksToBounds = true
        view.addSubview(bubbleView)
        return bubbleView
    }
}
