//
//  ApiMocker.swift
//  Random People
//
//  Created by Feridun Erbas on 23.05.2021.
//

import OHHTTPStubs

class ApiMocker {
    
    // MARK: - Private Properties
    private let filesLoader = MockApiFilesLoader()
    private var mockWindow = MockWindow()
    
    // MARK: - Public Properties
    open var options: ApiMockerOptions?
    public static let shared = ApiMocker()
    
    // MARK: - Init
    private init() {}
    
    
    func start(withOptions: ApiMockerOptions? = nil) {
        options = withOptions
        mockAPIs()
        showMockWindowIfNeeded()
    }
    
    private func mockAPIs() {
        let files = filesLoader.loadApiFiles()
        files.forEach { model in
            let methodCondition =  model.mock.method?.testCondition ?? { _ in true }
            let pathCondition = isPath(model.mock.urlPath)
            stub(condition: methodCondition&&pathCondition) { (request) -> HTTPStubsResponse in
                HTTPStubsResponse(fileAtPath: model.filePath, statusCode: model.mock.status ?? 200, headers: model.mock.headers).responseTime(0.5)
            }
        }
    }
    
    private func showMockWindowIfNeeded() {
        guard let options = options, options.mockWindowEnabled else { return }
        mockWindow.rootViewController = MockViewController()
        mockWindow.makeKeyAndVisible()
    }

}

private extension String {
    var testCondition: HTTPStubsTestBlock? {
        switch self {
        case "GET": return isMethodGET()
        case "POST": return isMethodPOST()
        case "DELETE": return isMethodDELETE()
        case "PUT": return isMethodPUT()
        default: return nil
        }
    }
}
