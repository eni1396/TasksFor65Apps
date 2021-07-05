//
//  main.swift
//  task#3
//
//  Created by Nikita Entin on 04.07.2021.
//

import Alamofire

private let apiManager = ApiManager()

while true {
    let username = readLine() ?? ""
    apiManager.getData(from: username) { repositories in
        print("\(username)'s repositories are")
        print(repositories.map { $0.name })
        print("----------------")
    }
}

