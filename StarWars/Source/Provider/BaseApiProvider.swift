//
//  BaseApiProvider.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 12/03/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import Alamofire

/// Default Completion Callback

typealias SuccessCallback = (_ data: AnyObject) -> Swift.Void
typealias FailureCallback = (_ error: Error) -> Swift.Void

/// Api Provider to manage backend access
internal class BaseApiProvider {
    
    fileprivate static let kIApiProviderUrl = "https://swapi.co/api/"
    
    static var headerId: String?
    
    // MARK: - Initializers
    
    init() { }
    
    // MARK: - Static Methods
    static func getWith(urlExtension: String, successBlock: @escaping SuccessCallback, failureBlock: @escaping FailureCallback) {
        Alamofire.request(kIApiProviderUrl + urlExtension).responseJSON { (data) in
            let result = data.result
            switch (result) {
            case .success(let data):
                successBlock(data as AnyObject)
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
        Alamofire.request(kIApiProviderUrl + urlExtension, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (data) in
            let result = data.result
            headerId = data.response?.allHeaderFields["state_id"] as? String
            switch (result) {
            case .success(let data):
                successBlock(data as AnyObject)
                break
            case .failure(let error):
                failureBlock(error)
                break
            }
        }
    }
}
