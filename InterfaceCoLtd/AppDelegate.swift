//
//  AppDelegate.swift
//  InterfaceCoLtd
//
//  Created by 김도형 on 2022/11/26.
//

import SwiftUI
import Firebase
import UserNotifications

enum NotificationType {
    case notice
    case none
}

class AppDelegate: NSObject, UIApplicationDelegate {
    let gcmMessageIDKey = "gcm.message_id"
    let aps = "aps"
    let data1Key = "DATA1"
    let data2Key = "DATA2"
    var notificationType: NotificationType = .none
    
    //앱이 실행됐을 때 발동
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //파이어베이스 설정
        FirebaseApp.configure()
        
        //메세징 대리자
        Messaging.messaging().delegate = self
        
        //원격 알림 등록
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { _, _ in
            
        }
        
        application.registerForRemoteNotifications()
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        print("userInfo: ", userInfo)
        completionHandler(UIBackgroundFetchResult.newData)
    }
}

extension AppDelegate : UNUserNotificationCenterDelegate{
    //푸시메세지가 앱이 실행중일 때 나타날 때
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("앱이 포그라운드에서 실행되는 동안 도착한 알림을 처리하는 방법")
        
        let userInfo = notification.request.content.userInfo
        
        print("willPresent: userInfo: ", userInfo)
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        if let data1 = userInfo[data1Key] {
            print("data1: \(data1)")
        }
        
        if let data2 = userInfo[data2Key] {
            print("data2: \(data2)")
        }
        
        if let apsData = userInfo[aps] {
            print("apsData: \(apsData)")
        }
        
        completionHandler([.banner, .badge, .sound])
    }
    
    //fcm 토큰이 등록 되었을 때
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("앱이 APNS에 성공적으로 등록되었음을 대리자에게 알림")
        Messaging.messaging().apnsToken = deviceToken
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("APNS가 등록 프로세스를 성공적으로 완료할 수 없어서 대리인에게 전송되었음")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("전달된 알림에 대한 사용자의 응답을 처리하도록 대리인에게 요청합니다.")
        
        let userInfo = response.notification.request.content.userInfo
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID from userNotificationCenter didReceive: \(messageID)")
        }
        
        if response.notification.request.content.title == "공지사항" {
            notificationType = .notice
        }
        
        completionHandler()
    }
}

extension AppDelegate: MessagingDelegate {
    //fcm 등록 토큰을 받았을 때
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("messaging")
        let deviceToken: [String: String] = ["token": fcmToken ?? ""]
        print("Device token: ", deviceToken)
    }
}
