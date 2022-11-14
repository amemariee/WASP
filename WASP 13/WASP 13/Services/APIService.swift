//
//  APIService.swift
//  WASP 13
//
//  Created by Jose Barroso on 11/9/22.
//

import Foundation

class APIService {
    static let shared = APIService()
//    enum APIError: Error {
//        case error
//    }
    
    func login(credentials: Credentials,
               completion: @escaping (Result<Bool, Authentication.AuthenticationError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if credentials.password == "password" {
                completion(.success(true))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
    }
}
