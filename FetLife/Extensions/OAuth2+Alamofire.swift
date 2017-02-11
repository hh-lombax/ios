//
//  OAuth2+Alamofire.swift
//  FetLife
//
//  Created by Jose Cortinas on 2/5/16.
//  Copyright © 2016 BitLove Inc. All rights reserved.
//

import Foundation
import p2_OAuth2
import Alamofire

extension OAuth2 {
    public func request(
        _ method: Alamofire.HTTPMethod,
        _ URLString: URLConvertible,
        parameters: [String: Any]? = nil,
        encoding: Alamofire.ParameterEncoding = URLEncoding.default,
        headers: [String: String]? = nil)
        -> Alamofire.DataRequest
    {
        
        var hdrs = headers ?? [:]
        
        if let token = accessToken {
            hdrs["Authorization"] = "Bearer \(token)"
        }
        return Alamofire.request(URLString, method: method, parameters: parameters, encoding: encoding, headers: hdrs)
    }
}
