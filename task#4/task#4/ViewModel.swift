//
//  ViewModel.swift
//  task#4
//
//  Created by Nikita Entin on 05.07.2021.
//

import Foundation


class ViewModel {
    
    private let minCharacters = 3
    private let maxCharacters = 32
    
    func checkLogin(login: String) -> Bool {
        if login.count < minCharacters || login.count > maxCharacters {
            return false
        }
        if login.contains("@") {
            return checkEmail(email: login)
        } else {
            return checkNick(login: login)
        }
    }
    
    
    func checkEmail(email: String) -> Bool {
        let emailRegex = "^[A-Za-z]([A-Za-z0-9](.){0,1}(-){0})+[A-Za-z0-9]\\@([A-Za-z0-9])+((.-){0,1}+[A-Za-z0-9]){1}\\.[a-z]{2,3}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func checkNick(login: String) -> Bool {
        let loginRegex = "^[a-zA-Z][a-zA-Z0-9.-]*$"
        return NSPredicate(format: "SELF MATCHES %@", loginRegex).evaluate(with: login)
    }
    
    
}
