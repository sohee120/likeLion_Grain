//
//  GrainApp.swift
//  Grain
//
//  Created by 조형구 on 2023/01/18.
//

import SwiftUI

import FirebaseCore
import KakaoSDKCommon
import KakaoSDKAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct GrainApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewRouter = ViewRouter()  // FIX
    
    init() {
           // Kakao SDK 초기화
            let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
            KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
       }
    
    var body: some Scene {
        WindowGroup {
            // viewRouter작업하기 위해 넣은 코드 <- 머지 할때 "지정훈" 불러주세요~
            Switchingview().environmentObject(viewRouter)
//            ContentView()
//                .environmentObject(AuthenticationStore())
//                .environmentObject(viewRouter)  // FIX
        }
    }
}
