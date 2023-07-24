////
////  NetworkManager.swift
////
////  Created by Liubov on 13.07.2023.
////
//import Foundation
//import Moya
//
//protocol NetworkManagerProtocol {
//    func fetchActivity(completion: @escaping (Result<ActivityResponseModel, Error>) -> Void)
//}
//
//final class NetworkManager : NetworkManagerProtocol {
//
//    private var provider = MoyaProvider<APITarget>()
////    private let dataController = DataController.shared
//
//    func fetchActivity(completion: @escaping (Result<ActivityResponseModel, Error>) -> Void) {
//        request(target: .getActivity, completion: completion)
//    }
//}
//
//private extension NetworkManager{
//    func request<T:Decodable>(target: APITarget, completion: @escaping (Result<T, Error>) -> Void) {
//        provider.request(target) { result in
//            switch result {
//            case let .success(response):
//                do {
//                    let results = try JSONDecoder().decode(T.self, from: response.data)
////                    self.dataController.addActivity(results as! ActivityResponseModel)
//
////                    print("JSON")
////                    print(results)
//                    completion(.success(results))
//                } catch let error {
//                    completion(.failure(error))
//                }
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
//}

import Foundation
import Moya

enum CommonAPITarget {
    case getActivity
    case getDog
}

// Let both APITarget and DogAPITarget inherit from CommonAPITarget
//enum APITarget: CommonAPITarget {
//    case getActivity
//}
//
//enum DogAPITarget: CommonAPITarget {
//    case getDog
//}

extension CommonAPITarget: TargetType {
    var baseURL: URL {
        switch self {
        case .getActivity:
            return URL(string: "https://www.boredapi.com")!
        case .getDog:
            return URL(string: "https://dog.ceo/api/breeds")!
        }
    }

    var path: String {
        switch self {
        case .getActivity:
            return "/api/activity"
        case .getDog:
            return "/image/random"
        }
    }

    var method: Moya.Method {
        .get
    }

    var task: Moya.Task {
        .requestPlain
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json", "Cache-Control": "no-cache"]
    }
}

protocol NetworkManagerProtocol {
    func fetchActivity(completion: @escaping (Result<ActivityResponseModel, Error>) -> Void)
    func fetchDog(completion: @escaping (Result<DogResponseModel, Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    private var provider = MoyaProvider<CommonAPITarget>()

    func fetchActivity(completion: @escaping (Result<ActivityResponseModel, Error>) -> Void) {
        request(target: .getActivity, completion: completion)
    }

    private var dogProvider = MoyaProvider<CommonAPITarget>()

    func fetchDog(completion: @escaping (Result<DogResponseModel, Error>) -> Void) {
        request(target: .getDog, completion: completion)
    }

    private func request<T: Decodable>(target: CommonAPITarget, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
