//
//  BaseApiProvider.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 12/03/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Alamofire

/// Default Completion Callback

typealias SuccessCallback = (_ data: Data?) -> Swift.Void
typealias FailureCallback = (_ error: Error) -> Swift.Void

/// Api Provider to manage backend access
internal class ApiProvider {
    
    fileprivate static let apiProviderUrl = "https://star-wars-diegofl.herokuapp.com/"
    //fileprivate static let apiProviderUrl = "http://localhost:5000/"
    
    static let imagesBaseUrl = apiProviderUrl + "img/"
    
    static var headerId: String?
    
    // MARK: - Initializers
    
    init() { }
    
    // MARK: - Static Methods
    static func getWith(urlExtension: String, successBlock: @escaping SuccessCallback, failureBlock: @escaping FailureCallback) {
        Alamofire.request(apiProviderUrl + urlExtension).responseJSON { (response) in
            let result = response.result
            switch (result) {
            case .success(_):
                successBlock(response.data)
                break
            case .failure(let error):
                failureBlock(error)
                break
            }
        }
    }
    
    // MARK: - Static Methods
    static func postWith(urlExtension: String, params: Dictionary<String, Any>, successBlock: @escaping SuccessCallback, failureBlock: @escaping FailureCallback) {
        //        let moc = ITBaseProviderMock(statusCode: .Ok, file: "Step1")
        //        successBlock(moc.loadResponse()?.value! as AnyObject)
        var headers = [String: String]()
        if let headerId = self.headerId {
            headers["state_id"] = headerId
        }
        Alamofire.request(apiProviderUrl + urlExtension, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseData) in
            let result = responseData.result
            headerId = responseData.response?.allHeaderFields["state_id"] as? String
            switch (result) {
            case .success(_):
                successBlock(responseData.data)
                break
            case .failure(let error):
                failureBlock(error)
                break
            }
        }
    }
}
