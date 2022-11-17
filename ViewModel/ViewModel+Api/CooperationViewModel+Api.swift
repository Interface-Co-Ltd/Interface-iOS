//
//  CooperationViewModel+Api.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/16.
//

import Foundation

extension ScheduleViewModel {
    private func fetch() async throws -> CodableCooperation {
        var compenents = URLComponents(string: "")
        
        compenents?.queryItems = [
            URLQueryItem(name: "api", value: Self.apiKey),
            URLQueryItem(name: "data", value: "Cooperation")
        ]
        
        guard let url = compenents?.url else {
            throw ApiError.invalidUrl(compenents?.host ?? "")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpsResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        
        guard httpsResponse.statusCode == 200 else {
            throw ApiError.failed(httpsResponse.statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(CodableCooperation.self, from: data)
        
        return result
    }
}
