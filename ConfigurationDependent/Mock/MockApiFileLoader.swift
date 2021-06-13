//
//  MockApiFileLoader.swift
//  Random People
//
//  Created by Feridun Erbas on 23.05.2021.
//

import Foundation

typealias ApiFilesDictionary = Dictionary<String, [ApiFile]>

class MockApiFilesLoader {
    
    func loadApiFiles() -> ApiFilesDictionary {
        let paths = Bundle.main.paths(forResourcesOfType: "json", inDirectory: "")
        let mockPaths = paths.filter { $0.components(separatedBy: "/").last?.hasPrefix("@Mock") == true }
        let mockFiles = mockPaths.compactMap { generateModel(for: $0) }
        var dictionary = ApiFilesDictionary()
        mockFiles.forEach { file in
            if dictionary[file.mock.urlPath] == nil {
                dictionary[file.mock.urlPath] = []
            }
            dictionary[file.mock.urlPath]?.append(file)
        }
        return dictionary
    }
    
    private func generateModel(for path: String) -> ApiFile? {
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let mockyJSON = try? JSONDecoder().decode(MockyJSON.self, from: data)
        else { return nil }
        return ApiFile(filePath: path, mock: mockyJSON.mock)
    }
}
