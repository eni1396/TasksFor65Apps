//
//  ViewController.swift
//  task#4
//
//  Created by Nikita Entin on 05.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    
    
    private let checkField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.cornerRadius = 10
        field.placeholder = "Check login"
        field.backgroundColor = .white
        field.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return field
    }()
    private let checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Check", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(checkString), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        checkField.delegate = self
        setupView()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func setupView() {
        [checkField, checkButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            checkField.widthAnchor.constraint(equalToConstant: 300),
            checkField.heightAnchor.constraint(equalToConstant: 50),
            checkField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkField.topAnchor.constraint(equalTo: view.topAnchor,constant: 350),
            
            checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkButton.widthAnchor.constraint(equalToConstant: 150),
            checkButton.heightAnchor.constraint(equalToConstant: 50),
            checkButton.topAnchor.constraint(equalTo: checkField.bottomAnchor,constant: 50)
        ])
    }
    
    @objc private func checkString() {
        guard let text = checkField.text else { return }
        if text.isEmpty {
            showAlert(title: nil, message: "Enter login")
            checkButton.backgroundColor = .lightGray
        } else {
            if viewModel.checkLogin(login: text) {
                showAlert(title: nil, message: "Correct")
                checkButton.backgroundColor = .green
            } else {
                showAlert(title: nil, message: "Incorrect")
                checkButton.backgroundColor = .red
            }
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        checkButton.backgroundColor = .lightGray
    }
}

extension UIViewController {
    func showAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
