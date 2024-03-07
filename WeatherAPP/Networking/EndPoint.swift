//
//  EndPoint.swift
//  canva
//
//  Created by Muhammad Salman on 8/22/22.
//

import Foundation

enum EndPoint {
    case current(BaseNetworkRequestable)
    case uploadImage
}

extension EndPoint {

    var path: String {
        switch self {
        case .current:
            return "current.json"
        case .uploadImage:
            return "upload_image"
        }
    }
    
    var query: [URLQueryItem]? {
        switch self {
        case .current(let value):
            return value.associatedValues.toURLQueryItem
        default:
            return nil
        }
    }
    
    var data: Data? {
        switch self {
        case .current:
            return nil
        default:
            return nil
        }
    }
    
    var method: String {
        switch self {
        case  .uploadImage:
            return HTTPMethod.post.rawValue
        default:
            return HTTPMethod.get.rawValue
        }
    }
    
    var url: URL? {
        var component = URLComponents(string: API.baseUrl + path)
        component?.queryItems = query
        return component?.url
    }
    
    var httpHeaders: [String: String] {
        return [HTTPContentType.json.rawValue: "content-type"]
    }
    
    var urlRequest: URLRequest? {
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = data
        httpHeaders.forEach({
            request.setValue($0.key, forHTTPHeaderField: $0.value)
        })
        return request
    }
    
}
