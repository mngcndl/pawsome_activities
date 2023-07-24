//////
//////  DogAPITarget.swift
//////  ProjectApp
//////
//////  Created by Liubov on 24.07.2023.
//////
//////https://dog.ceo/api/breeds/image/random
////
////import Foundation
////import Moya
////
////enum DogAPITarget {
////    case getDog
////}
////
////extension DogAPITarget: TargetType {
////    var baseURL: URL {
////        guard let url = URL(string: "https://dog.ceo/api/breeds") else {
////            fatalError("Sorry, the url can not be found.")
////        }
////        return url
////    }
////
////    var path: String {
////        switch self {
////        case .getDog:
////            return "/image/random"
////        }
////    }
////
////    var method: Moya.Method {
////        .get
////    }
////
////    var task: Moya.Task {
////        .requestPlain
////    }
////
////    var headers: [String : String]? {
////        return ["Content-type": "application/json", "Cache-Control": "no-cache"]
////    }
////}
////
//
//import Foundation
//import Moya
//
//enum DogAPITarget: CommonAPITarget {
//    case getDog
//}
//
//extension DogAPITarget: TargetType {
//    var baseURL: URL {
//        guard let url = URL(string: "https://dog.ceo/api/breeds") else {
//            fatalError("Sorry, the url can not be found.")
//        }
//        return url
//    }
//    
//    var path: String {
//        switch self {
//        case .getDog:
//            return "/image/random"
//        }
//    }
//    
//    var method: Moya.Method {
//        .get
//    }
//    
//    var task: Moya.Task {
//        .requestPlain
//    }
//    
//    var headers: [String : String]? {
//        return ["Content-type": "application/json", "Cache-Control": "no-cache"]
//    }
//}
