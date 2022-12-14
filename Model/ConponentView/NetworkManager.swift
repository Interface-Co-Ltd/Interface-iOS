//
//  NetworkManager.swift
//  InterfaceCoLtd
//
//  Created by κΉλν on 2022/11/29.
//

import Foundation
import SwiftUI
import Network

class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")

    @Published var isConnected = true
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        
        monitor.start(queue: queue)
    }
    
//    func startMonitoring() {
//        monitor.start(queue: queue)
//        monitor.pathUpdateHandler = { path in
//            self.isConnected = path.status == .satisfied
//
//            if path.usesInterfaceType(.wifi) {
//                print("Using wifi")
//            } else if path.usesInterfaceType(.cellular) {
//                print("Using cellular")
//            }
//        }
//    }
//
//    func stopMonitoring() {
//        monitor.cancel()
//    }
}
