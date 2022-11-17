//
//  ScheduleViewModel+Api.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/15.
//

import Foundation

extension ScheduleViewModel {
    private func fetch() async throws -> CodableSchedule {
        var compenents = URLComponents(string: "")
        
        compenents?.queryItems = [
            URLQueryItem(name: "api", value: Self.apiKey),
            URLQueryItem(name: "data", value: "SCHEDULE")
        ]
        
        guard let url = compenents?.url else {
            throw ApiError.invalidUrl(compenents?.host ?? "")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw ApiError.failed(httpResponse.statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(CodableSchedule.self, from: data)
        
        return result
    }
}
