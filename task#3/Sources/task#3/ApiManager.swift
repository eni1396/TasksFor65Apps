//
//  ApiManager.swift
//  task#3
//
//  Created by Nikita Entin on 04.07.2021.
//

import Foundation
import Alamofire


struct RepositoryInfo: Codable {
    let name: String
}

final class ApiManager {
    func getData(from user: String, completion: @escaping ([RepositoryInfo]) -> ()) {
        let urlString = "https://api.github.com/users/\(user)/repos"
        guard let url = URL(string: urlString) else { return }
        AF.request(url).validate().responseJSON(queue: DispatchQueue.global()) { response in
            if let error = response.error {
                print(error.errorDescription ?? "")
            }
            guard let data = response.data,
                  let repos = try? JSONDecoder().decode([RepositoryInfo].self, from: data) else { return }
            completion(repos)
        }
    }
}
