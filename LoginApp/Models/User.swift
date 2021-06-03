//
//  User.swift
//  LoginApp
//
//  Created by Ilya Yushkov on 01.06.2021.
//

struct User {
    
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(login: "Ilya",
             password: "Password",
             person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let description: FullDescription
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Ilya", surname: "Yushkov", description: .userOne)
    }
}

enum FullDescription {
    
    case userOne
    case userTwo
    case userThree
    
    var description: String {
        switch self {
        case .userOne:
            return "Родился в 1995 в городе Челябинске. Закончил ЮУРГАУ. Начинающий iOS разработчик. В свободное время любит погулять, погрустить о прошлом и сходить социализироваться :D"
        case .userTwo:
            return "Родился в 1994 в городе Москва. Закончил МГУ. Team lead и просто хороший парень! В настоящее время тянет за собой команду, подающую надежды."
        case .userThree:
            return "Родился в 1993 году в городе Челябинске. Закончил монтажку. Пошел против системы и работает в КБ вот уже 12 лет. Свободное время любит проводить с семьей."
        }
    }
}
