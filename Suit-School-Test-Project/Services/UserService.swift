//
//  UserService.swift
//  Suit-School-Test-Project
//
//  Created by ahmadfarhanqf on 08/06/26.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case unauthorized
    case decodingFailed
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid server response."
        case .unauthorized:
            return "API key is missing or invalid."
        case .decodingFailed:
            return "Failed to decode data."
        case .unknown:
            return "Something went wrong."
        }
    }
}

final class UserService {
    func fetchUsers(page: Int, perPage: Int) async throws -> ReqResUserResponse {
        let urlString = "\(APIConfig.baseURL)/users?page=\(page)&per_page=\(perPage)"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIConfig.apiKey, forHTTPHeaderField: "x-api-key")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        if httpResponse.statusCode == 401 {
            throw NetworkError.unauthorized
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(ReqResUserResponse.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
