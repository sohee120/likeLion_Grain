//
//  UserViewModel.swift
//  Grain
//
//  Created by 박희경 on 2023/01/23.
//

import Foundation
import FirebaseFirestore

import Foundation
import Combine


final class UserViewModel: ObservableObject {
 
    var subscription = Set<AnyCancellable>()
    
    @Published var users = [UserDocument]()
    // 현재 유저 데이터 값
    @Published var currentUsers : CurrentUserFields?

    var fetchUsersSuccess = PassthroughSubject<(), Never>()
    var insertUsersSuccess = PassthroughSubject<(), Never>()

    func fetchUser() {
        UserService.getUser()
            .receive(on: DispatchQueue.main)
            .sink { (completion: Subscribers.Completion<Error>) in
        } receiveValue: { (data: UserResponse) in
            self.users = data.documents
            self.fetchUsersSuccess.send()
        }.store(in: &subscription)

    }

    
    func fetchCurrentUser(userID: String) {
        UserService.getCurrentUser(userID: userID)
            .receive(on: DispatchQueue.main)
            .sink { (completion: Subscribers.Completion<Error>) in
        } receiveValue: { (data: CurrentUserResponse) in
            self.currentUsers = data.fields
//            print(" 확인 \(data.createTime)") -> 시간 값 나중에 써먹을수 있을듯
            self.fetchUsersSuccess.send()
        }.store(in: &subscription)
        

    }
    func updateUser(updateDocument: String, updateKey: String, updateValue: String, isArray: Bool) async {
        
        let db = Firestore.firestore()
        let documentRef = db.collection("User").document("\(updateDocument)")
        if isArray{
            do{
                try? await documentRef.updateData(
                    [
                        "\(updateKey)": FieldValue.arrayUnion(["\(updateValue)"])
                    ]
                )
            }catch let error {
                print("Error updating document: \(error)")
            }
        }else{
            do{
                try? await documentRef.updateData(
                    [
                         "\(updateKey)" : "\(updateValue)"
                    ]
                )
            }catch let error {
                print("Error updating document: \(error)")
            }
        }
       
        
    }
    

    
}

