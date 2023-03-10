//
//  EditMyPageView.swift
//  Grain
//
//  Created by 한승수 on 2023/01/31.
//

import SwiftUI
import Combine

// 텍스트 필드 포커스를 위한 열거형
private enum FocusableField: Hashable {
    case nickName
    case introduce
}

struct EditMyPageView: View {
    @AppStorage("docID") private var docID : String?
    var userVM: UserViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var editedNickname = ""
    @State private var editedIntroduce = ""
    
    let nickNameLimit = 8
    let introduceLimit = 20
    
    @FocusState private var focus: FocusableField?

    
    var body: some View {
        VStack {
//            //MARK: 상단바
//            HStack{
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }, label: {
//                    HStack {
//                        Image(systemName: "chevron.left")
//                        Text("설정")
//                    }
//                })
//                
//                Spacer()
//                
//                Button{
//                    
//                }label: {
//                    Text("저장")
//                }
//            }
//            .accentColor(.black)
//            .padding(.horizontal)

            //MARK: 프로필 이미지 변경 버튼
            Button {
                //이미지 선택 동작
            } label: {
                Image("2")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(64)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 1.5)
                            .foregroundColor(.black)
                    }
                    .overlay {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .offset(x: Screen.maxWidth * 0.1, y: Screen.maxHeight * 0.04)
                            .overlay {
                                Image(systemName: "camera.circle.fill")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(.black)
                                    .offset(x: Screen.maxWidth * 0.1, y: Screen.maxHeight * 0.04)
                            }
                    }
            }
            
            //MARK: 닉네임, 소개 변경 텍스트 필드
            VStack{
                HStack {
                    Text("닉네임")
                        .padding(.horizontal, 3)
                    Spacer()
                    Text("\(editedNickname.count)/8")
                }
                .padding(.horizontal)
                
                HStack{
                    TextField("변경할 닉네임을 입력해주세요", text: $editedNickname)
                        .focused($focus, equals: .nickName)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .onReceive(Just(editedNickname)) { _ in
                            limitNickname(nickNameLimit)
                        }
                    
                    if (focus == .nickName) || editedNickname.count > 0 {
                        HStack{
                            Button {
                                self.editedNickname = ""
                            } label: {
                                Image(systemName: "x.circle.fill")
                            }
                            .tint(.gray)
                            .padding(.trailing, 7)
                            .animation(.easeInOut, value: focus)
                        }
                    }
                }
                .underlineTextField()
                .padding(.bottom, 30)


                
                HStack {
                    Text("소개")
                        .padding(.horizontal, 3)
                    Spacer()
                    Text("\(editedIntroduce.count)/20")
                }
                .padding(.horizontal)
                
                HStack{
                    TextField("소개글을 입력해주세요", text: $editedIntroduce)
                        .focused($focus, equals: .introduce)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .onReceive(Just(editedIntroduce)) { _ in
                            limitIntroduce(introduceLimit)
                        }
                    
                    if (focus == .introduce) || editedIntroduce.count > 0 {
                        HStack{
                            Button {
                                self.editedNickname = ""
                            } label: {
                                Image(systemName: "x.circle.fill")
                            }
                            .tint(.gray)
                            .padding(.trailing, 7)
                            .animation(.easeInOut, value: focus)
                        }
                    }
                }
                .underlineTextField()
                .padding(.bottom, 30)
            }
            
            Spacer()

        }
        .navigationTitle("프로필 편집")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    Task{
                        await userVM.updateUser(updateDocument: docID ?? "", updateKey: "nickName", updateValue: editedNickname, isArray: false)
                    }
                }label: {
                    Text("저장")
                }
            }
        }
//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)
        .onAppear{
            focus = .nickName
            editedNickname = userVM.currentUsers?.nickName.stringValue ?? ""
        }
    }
    
    func limitNickname(_ upper: Int) {
        if editedNickname.count > upper {
            editedNickname = String(editedNickname.prefix(upper))
        }
    }
    func limitIntroduce(_ upper: Int) {
        if editedIntroduce.count > upper {
            editedIntroduce = String(editedIntroduce.prefix(upper))
        }
    }
}

//struct EditMyPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditMyPageView()
//    }
//}


extension View {
    func underlineTextField() -> some View {
        self
            .padding(.horizontal, 10)
            .overlay(Rectangle().frame(width: Screen.maxWidth * 0.9, height: 1.3).padding(.top, 35).padding(.horizontal))
            .foregroundColor(Color(UIColor.black))
            .padding(.horizontal,10)
    }
}
