//
//  MockDetailViewController.swift
//  Random People
//
//  Created by Feridun Erbas on 14.06.2021.
//

import UIKit

class MockDetailViewController: UIViewController {
    private lazy var textView = makeTextView()
    var viewModel: MockDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = viewModel.text
    }
}

extension MockDetailViewController {
    private func makeTextView() -> UITextView {
        let textView = UITextView(frame: view.bounds)
        textView.isEditable = false
        view.addSubview(textView)
        return textView
    }
}

class MockDetailViewModel {
    var text: String
    var model: ApiFile
    init(model: ApiFile) {
        self.model = model
        text = try! String(contentsOfFile: model.filePath)
    }
}
