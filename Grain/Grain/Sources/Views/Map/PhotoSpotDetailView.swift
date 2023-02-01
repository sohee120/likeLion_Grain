//
//  PhotoSpotDetailView.swift
//  Grain
//
//  Created by 지정훈 on 2023/01/23.
//

import SwiftUI

// TODO: 포토스팟 마커 클릭시 넘어올 뷰
struct PhotoSpotDetailView: View {
    var title : String = "피고 놀이 꽃 것은 피가 못할 힘있다."
    var location: String = "방구석 어딘가"
    @State private var isBookMarked: Bool = false
    var image: [String] = ["sampleImage","sampleImage","sampleImage"]
    var profileImage: String = "sampleImage"
    var nickName: String = "테스트 봇1"
    var content: String = "테스트 중입ㄴ디ㅏ 나중에 글이 들어올 부분입니다"
    @State private var isliked: Bool = false
    var body: some View {
        VStack{
            ScrollView {
                VStack {
                    HStack{
                        VStack(alignment: .leading){
                            Text("\(title)")
                                .multilineTextAlignment(.leading)
                                .font(.title)
                                .bold()
                            
                            HStack{
//                                Image(systemName: "mappin")
                                Text(location)
                            }
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            
                        }
                        
                        Spacer()
                        
                        Button {
                            isBookMarked.toggle()
                        } label: {
                            Image(systemName: isBookMarked ? "bookmark.fill" : "bookmark")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        
                    } //상단 타이틀, 북마크
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    
                    TabView {
                        ForEach(image, id: \.self)  { img in
                            Image(img)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: Screen.maxWidth, height: Screen.maxHeight * 0.3)
                        }
                    } //이미지 뷰
                    .tabViewStyle(.page)
                    .frame(height: Screen.maxHeight * 0.3)
                    
                    HStack {
                        ProfileImage(imageName: profileImage, width: 60, height: 60)
                        Text(nickName)
                            .font(.title3)
                            .bold()
                        Spacer()
                        
                        Button{
                            
                        } label: {
                            Text("팔로우")
                        }
                        .padding(.trailing, 10)
                        
                    } // 작성자 프로필
                    .padding(.horizontal)
                    
                    Text(content)
                        .padding(.horizontal, 30)
                        .multilineTextAlignment(.leading)
//                        .padding(.top, 1)
                    
                    HStack{
                        Button{
                            isliked.toggle()
                        } label: {
                            Image(systemName: isliked ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                        }
                        Text("50")
                        
                        Image(systemName: "text.bubble")
                        Text("12")
                        
                        Spacer()
                    }
                    .padding(.leading, 30)
                    .padding(.top, 10)
                    
                    
                } // top vstack
            } //scroll view
        }
    }
}

struct PhotoSpotDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSpotDetailView()   // FIX
    }
}