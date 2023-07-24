////import Foundation
////import Moya
////
////enum APITarget {
////    case getActivity
////}
////
////extension APITarget: TargetType {
////    var baseURL: URL {
////        guard let url = URL(string: "https://www.boredapi.com") else {
////            fatalError("Sorry, the url can not be found.")
////        }
////        return url
////    }
////
////    var path: String {
////        switch self {
////        case .getActivity:
////            return "/api/activity"
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
//
//import Foundation
//import Moya
//
//enum APITarget : CommonAPITarget {
//    case getActivity
//}
//
//extension APITarget: TargetType {
//    var baseURL: URL {
//        guard let url = URL(string: "https://www.boredapi.com") else {
//            fatalError("Sorry, the url can not be found.")
//        }
//        return url
//    }
//    
//    var path: String {
//        switch self {
//        case .getActivity:
//            return "/api/activity"
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
