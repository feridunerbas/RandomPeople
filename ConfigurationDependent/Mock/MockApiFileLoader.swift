//
//  MockApiFileLoader.swift
//  Random People
//
//  Created by Feridun Erbas on 23.05.2021.
//

import Foundation

class MockApiFilesLoader {
    
    func loadApiFiles() -> [ApiFile] {
        let paths = Bundle.main.paths(forResourcesOfType: "json", inDirectory: "")
        let mockPaths = paths.filter { $0.components(separatedBy: "/").last?.hasPrefix("@Mock") == true }
        return mockPaths.compactMap { generateModel(for: $0) }
    }
    
    private func generateModel(for path: String) -> ApiFile? {
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let mockyJSON = try? JSONDecoder().decode(MockyJSON.self, from: data)
        else { return nil }
        return ApiFile(filePath: path, mock: mockyJSON.mock)
    }
}
