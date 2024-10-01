//
//  APIClientProtocol.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 30/09/24.
//

import Combine

protocol APIClient {
  associatedtype EndpointType: APIEndpoint
  func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}
