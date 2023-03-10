//
//  SplashScremm.swift
//  Grain
//
//  Created by 윤소희 on 2023/02/01.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive:Bool = false
    @State private var isActive1:Bool = false
    @State private var isAnimation:Bool = false
    @State private var isAnimation2:Bool = false
    @State private var isAnimation3:Bool = false
    @State private var isAnimation4:Bool = false
    @State private var isAnimation5:Bool = false
    @State private var animate = false
    @State private var endSplash = false
    @State private var rotation = -80.0
    
    var body: some View {
        ZStack {
            if !isActive {
                Image("019")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .offset(x: rotation)
                
                if isAnimation {
                    Image("019")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                        .offset(x: rotation)
                    
                    if isAnimation {
                        Image("018")
                            .resizable()
                            .scaledToFit()
                            .ignoresSafeArea()
                            .offset(x: rotation)
                        
                        if isAnimation2 {
                            Image("017")
                                .resizable()
                                .scaledToFit()
                                .ignoresSafeArea()
                                .offset(x: rotation)
                            
                            if isAnimation3 {
                                Image("016")
                                    .resizable()
                                    .scaledToFit()
                                    .ignoresSafeArea()
                                    .offset(x: rotation)
                                
                                if isAnimation4 {
                                    Image("015")
                                        .resizable()
                                        .scaledToFit()
                                        .ignoresSafeArea()
                                        .offset(x: rotation)
                                }
                            }
                        }
                    }
                }
            }
            if isAnimation5 {
                ZStack{
                    
                    Image("flash3")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: animate ? .fill : .fit)
                        .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                    
                        .scaleEffect(animate ? 3 : 1)
                    
                        .frame(width: UIScreen.main.bounds.width)
                }
                .ignoresSafeArea()
                .onAppear(perform: animateSplash)
                .opacity(endSplash ? 0 : 1)
            }
        } // ZStack
        .animation(.easeIn(duration: 0.5), value: rotation)
        .onAppear {
            rotation = -20
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    self.isAnimation = true
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                withAnimation {
                    self.isAnimation2 = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                withAnimation {
                    self.isAnimation3 = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                withAnimation {
                    self.isAnimation4 = true
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
                withAnimation(.easeOut(duration: 0.5)) {
                    self.isActive = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                withAnimation {
                    self.isAnimation5 = true
                }
            }
        }
//        .onChange(of: isActive) { newValue in
//            if newValue {
//                if let _ = UserDefaults.standard.string(forKey: "userIdToken") {
//                    viewModel.state = .signIn // 로그인 성공 기록이 있을 경우
//                } else {
//                    viewModel.state = .signOut
//                }
//            }
//        }
        .ignoresSafeArea()
    }
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now()){
            withAnimation(Animation.easeOut(duration: 0.45)){
                animate.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.45)){
                endSplash.toggle()
            }
        }
    }
}


struct SplashScremm_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

