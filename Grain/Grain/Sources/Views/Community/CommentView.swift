//
//  CommentView.swift
//  Grain
//
//  Created by 홍수만 on 2023/01/20.
//

import SwiftUI

struct CommentView: View {
    var comment: Comment
    
    var body: some View {
        HStack(alignment: .top) {
            
            ProfileImage(imageName: comment.profileImage, width: 45, height: 45)
            
            VStack(alignment: .leading) {
                Text("\(comment.nickName)")
                    .bold()
                    .padding(.bottom, 1)
                Text("\(comment.comment)")
                    .lineLimit(Int.max)
                
                //MARK: 댓글 에디트
                HStack {
                    Button{
                        
                    } label: {
                        Text("답글쓰기")
                    }
                    Button{
                        
                    } label: {
                        Text("수정")
                    }
                    Button{
                        
                    } label: {
                        Text("삭제")
                    }

                }
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 1)
            }
        }
        //            Rectangle()
        //                .frame(width: Screen.maxWidth - 30, height: 0.5)
        //                .foregroundColor(.secondary)
        //                .padding([.leading, .trailing], 20)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: Comment(id: "ddd", userID: "ddd", profileImage: "1", nickName: "승수", comment: "동해물가 백두산이 마르고 닿도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이보전하세", createdAt: Date()))
    }
}
