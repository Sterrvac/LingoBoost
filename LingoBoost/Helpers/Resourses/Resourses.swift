import UIKit

// MARK: - Resourses

enum Resourses {
    enum Strings {
        enum MainHeaders {
            static let registration = "Регистрация"
            static let autorization = "Авторизация"
            static let start = "Начать"
            static let selectionLanguage = "Выбор языка:"
            static let name = "Имя"
            static let email = "Почта"
            static let password = "Пароль"
            static let forgotPassword = "Забыли пароль"
        }
        enum TextHeaders {
            static let lingoBoost = "LingoBoost"
            static let mainTextStartView = "Увеличиваем запаc слов на иностранных языках!"
            static let descriptionStartView = "Добавляй интересующие тебя слова повторяй их в любое время!"
            static let descriptionTextStartView = "Приглашай друзей и соревнуйся с ними"
        }
        enum Language {
            static let english = "Английский"
            static let russia = "Русский"
        }
        enum Icons {
            static let person = UIImage(systemName: "person")
            static let envelope = UIImage(systemName: "envelope")
            static let lock = UIImage(systemName: "lock")
        }
    }
}
