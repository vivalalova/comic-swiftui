//
//  API.swift
//  comic-swiftui
//
//  Created by Lova on 2021/3/14.
//

import FetchSwift
import Foundation

extension String {
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }

    var url: URL? {
        URL(string: self.replace(target: "http://", withString: "https://"))
    }
}

let api = API.shared

final class API: Fetch {
    var domain: String = "https://eits.cf/"

    var decoder = JSONDecoder()

    var encoder = JSONEncoder()

    static var shared = API()

    func willSend(params: [String: Any], method: FetchSwift.Method, path: String) -> Params {
        params
    }

    func willSend(request: URLRequest, method: FetchSwift.Method, path: String, params: [String: Any]) -> URLRequest {
        request
    }

    func show(progress: Float?) {}

    func hide(progress: Float?) {}
}

extension API {
    func category() -> Response<[String]> {
        self.fetch(path: "category")
    }

    struct Catalog: Codable, Identifiable {
        let id: String?
        let title: String?
        let author: String?
        let category: String?
        let welcomeDescription: String?
        let url: String?
        let thumbnail: String?

        let updatedAt: String?
        let createdAt: String?
        let hot: Int?

        enum CodingKeys: String, CodingKey {
            case id = "ID"
            case title, author, category
            case welcomeDescription = "description"
            case url = "URL"
            case thumbnail = "thumbnailURL"
            case updatedAt = "_updated_at"
            case createdAt = "_created_at"
            case hot
        }
    }

    func catalog() -> Response<[Catalog]> {
        self.fetch(path: "catalog")
    }

    // https://eits.cf/catalog/QYZ/chapter
    // https://eits.cf/catalog/QYZ
    // https://eits.cf/catalog/QYZ/chapter/k4VMgeoqXS
    // https://eits.cf/catalog/QYZ/chapter/k4VMgeoqXS/page
    // https://eits.cf/catalog?category=%E5%86%92%E9%99%A9%E7%B1%BB
}
