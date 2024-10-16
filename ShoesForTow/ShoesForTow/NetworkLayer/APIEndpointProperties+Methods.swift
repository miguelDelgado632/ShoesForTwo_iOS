//
//  APIEndpointProperties+Methods.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 30/09/24.
//

import Foundation

protocol APIEndpoint {
  var baseURL: URL { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var headers: [String: String]? { get }
  var parameters: [URLQueryItem]? { get }
  var body: [String: Any]? { get }
}

enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
}

enum APIError: Error {
  case invalidResponse
  case invalidData
}

enum NetworkError: Error {
  case badUrl
  case invalidResponse(ErrorRequest)
  case decodingError
  case invalidServerResponse
  case invalidURL
}

struct ErrorRequest: Decodable {
  let status: Int
  let message: String
}
