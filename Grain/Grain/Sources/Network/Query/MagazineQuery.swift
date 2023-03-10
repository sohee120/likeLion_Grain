//
//  MagazineQuery.swift
//  Grain
//
//  Created by 지정훈 on 2023/01/18.
//

import Foundation


enum MagazineQuery {
    // MARK: 매거진 DB에 데이터 저장
    /// id값 패스
    static func insertMagazineQuery(userID: String, cameraInfo: String, nickName: String, image: [String], content: String, title: String,lenseInfo:String,longitude: Double,likedNum: Int,filmInfo: String, customPlaceName: String,latitude: Double,comment: String,roadAddress: String) -> Data?{
        
        var str : String = ""
        for i in 0..<image.count {
            str += """
                { "stringValue": "\(image[i])" },
                """
        }
        //FIXME: 강해져서 돌아오기
        //        str.removeLast()
        
        return
        """
        {
            "fields": {
                        "longitude": {
                            "integerValue": \(longitude)
                        },
                        "likedNum": {
                            "integerValue": \(likedNum)
                        },
                        "nickName": {
                            "stringValue": "\(nickName)"
                        },
                        "cameraInfo": {
                            "stringValue": "\(cameraInfo)"
                        },
                        "latitude": {
                            "integerValue": \(latitude)
                        },
                        "title": {
                            "stringValue": "\(title)"
                        },
                        "image": {
                            "arrayValue": {
                                "values": [
                                            \(str)
                                ]
                            }
                        },
                        "filmInfo": {
                            "stringValue": "\(filmInfo)"
                        },
                        "customPlaceName": {
                            "stringValue": "\(customPlaceName)"
                        },
                        "content": {
                            "stringValue": "\(content)"
                        },
                        "userID": {
                            "stringValue": "\(userID)"
                        },
                        "lenseInfo": {
                            "stringValue": "\(lenseInfo)"
                        },
                        "comment": {
                            "arrayValue": {
                                "values": [
                                    {
                                        "stringValue": "\(comment)"
                                    }
                                ]
                            }
                        },
                        "id": {
                            "stringValue":  ""
                        },
                        "roadAddress": {
                            "stringValue": "\(roadAddress)"
                        }
                    }
            }
        """.data(using: .utf8)
    }
    
    // FIXME: 메서드명 고치기
    static func updateMagazineQuery(data: MagazineDocument, docID: String) -> Data?{
        var str : String = ""
        var comment : String = ""
        
        for i in 0..<data.fields.image.arrayValue.values.count {
            str += """
                 { "stringValue": "\(data.fields.image.arrayValue.values[i].stringValue)" },
                """
        }
        //FIXME: 강해져서 돌아오기!!
        //FIXME: 강해져서 돌아오기!!
        for i in 0..<data.fields.comment.arrayValue.values.count{
            comment += """
                  { "stringValue": "\(data.fields.comment.arrayValue.values[i].stringValue)" }
            """
        }
        str.removeLast()
//        comment.removeLast()
        return
        """
        {
            "fields": {
                "lenseInfo": {
                    "stringValue": "\(data.fields.lenseInfo.stringValue)"
                },
                "image": {
                    "arrayValue": {
                        "values": [
                                \(str)
                        ]
                    }
                },
                "id": {
                    "stringValue": "\(docID)"
                },
                "likedNum": {
                  "integerValue": \(data.fields.likedNum.integerValue)
                },
                "title": {
                  "stringValue": "\(data.fields.title.stringValue)"
                },
                "filmInfo": {
                  "stringValue": "\(data.fields.filmInfo.stringValue)"
                },
                "cameraInfo": {
                  "stringValue": "\(data.fields.cameraInfo.stringValue)"
                },
                "customPlaceName": {
                  "stringValue": "\(data.fields.customPlaceName.stringValue)"
                },
                "content": {
                  "stringValue": "\(data.fields.content.stringValue)"
                },
                "latitude": {
                  "doubleValue": "\(0)"
                },
                "longitude": {
                  "doubleValue": \(0)
                },
                "nickName": {
                  "stringValue": "\(data.fields.nickName.stringValue)"
                },
                "comment": {
                  "arrayValue": {
                    "values": [
                      
                         \(comment)
                      
                    ]
                  }
                },
                "roadAddress": {
                  "stringValue": "\(data.fields.roadAddress.stringValue)"
                },
                "userID": {
                  "stringValue": "\(data.fields.userID.stringValue)"
                }
        
            }
        }
        """.data(using: .utf8)
    }
}
