//
//  MockListViewModel.swift
//  Random People
//
//  Created by Feridun Erbas on 13.06.2021.
//

import Foundation

class MockListViewModel {
    let files = ApiMocker.shared.files.map { MockListSection(title: $0.key, files: $0.value) }
}

struct MockListSection {
    var title: String
    var files: [ApiFile]
}
