//
//  MockWindow.swift
//  Random People
//
//  Created by Feridun Erbas on 13.06.2021.
//

import UIKit

class MockWindow: UIWindow {
    
    private let mockRootController = MockViewController()
        
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        bounds.size.height = UIScreen.main.bounds.height.nextDown
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        windowLevel = UIWindow.Level(rawValue: UIWindow.Level.alert.rawValue - 1)
        rootViewController = mockRootController
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        mockRootController.point(inside: point, with: event)
    }
}
