//
//  URLSessionAPIClient.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 30/09/24.
//

import Foundation
import Combine

class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {

  var cancellables = Set<AnyCancellable>()

  func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {
    let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.method.rawValue

    endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }

    if let params = endpoint.parameters {
      var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
      components?.queryItems = params
      if let newUrl = components?.url {
        request.url = newUrl
      }
    }

    let curlCommand = generateCurlCommand(from: request)
    print("👻👻👻👻👻👻👻👻👻👻👻👻CURL👻👻👻👻👻👻👻👻👻👻👻👻👻👻")
    print(curlCommand)
    print("👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻")

    return URLSession.shared.dataTaskPublisher(for: request)
      .subscribe(on: DispatchQueue.global(qos: .background))
      .tryMap { data, response -> Data in
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
          throw APIError.invalidResponse
        }
        print("🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️RESPONSE🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️")
        print(String(data: data, encoding: .utf8) ?? "NA")
        print("🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️🤷‍♂️")
        return data
      }
      .tryMap { data in
        if let result = try? JSONDecoder().decode(ErrorRequest.self, from: data),
           !(200...299).contains(result.status) {
          throw NetworkError.invalidResponse(result)
        } else {
          return data
        }
      }
      .decode(type: T.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}


fileprivate func generateCurlCommand(from request: URLRequest) -> String {
  var curlCommand = "curl"

  // Add URL
  if let url = request.url {
    curlCommand += " '\(url.absoluteString)'"
  }

  // Add HTTP Method
  if let httpMethod = request.httpMethod {
    curlCommand += " -X \(httpMethod)"
  }

  // Add Headers
  if let headers = request.allHTTPHeaderFields {
    for (key, value) in headers {
      curlCommand += " -H '\(key): \(value)'"
    }
  }

  // Add Body Data
  if let bodyData = request.httpBody, let bodyString = String(data: bodyData, encoding: .utf8) {
    curlCommand += " -d '\(bodyString)'"
  }

  return curlCommand
}

