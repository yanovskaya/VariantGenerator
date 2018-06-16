//
//  main.swift
//  VariantGenerator
//
//  Created by Elena Yanovskaya on 13.06.2018.
//  Copyright © 2018 Elena Yanovskaya. All rights reserved.
//

import Foundation

print("Введите свою фамилию:")

func convertToNumber(letter: Character) -> Int? {
    switch letter {
    case "А":
        return 1
    case "Б":
        return 2
    case "В":
        return 3
    case "Г":
        return 4
    case "Д":
        return 5
    case "Е":
        return 6
    case "Ё":
        return 7
    case "Ж":
        return 8
    case "З":
        return 9
    case "И":
        return 10
    case "Й":
        return 11
    case "К":
        return 12
    case "Л":
        return 13
    case "М":
        return 14
    case "Н":
        return 15
    case "О":
        return 16
    case "П":
        return 17
    case "Р":
        return 18
    case "С":
        return 19
    case "Т":
        return 20
    case "У":
        return 21
    case "Ф":
        return 22
    case "Х":
        return 23
    case "Ц":
        return 24
    case "Ч":
        return 25
    case "Ш":
        return 26
    case "Щ":
        return 27
    case "Ъ":
        return 28
    case "Ы":
        return 29
    case "Ь":
        return 30
    case "Э":
        return 31
    case "Ю":
        return 32
    case "Я":
        return 33
    default:
        return nil
    }
}

func getNumberForFirstTask(for surname: String?) -> Character? {
    guard let firstCharacter = surname?.first,
        let number = convertToNumber(letter: firstCharacter) else { return nil }
    print("Первая буква: \(firstCharacter), ее порядковый номер: \(number)")
    let modulo = number % 2
    print("Остаток от деления на 2 плюс 1 = \(modulo + 1)")
    switch modulo + 1 {
    case 1:
        return "А"
    case 2:
        return "Б"
    default:
        return nil
    }
}

func getNumberForSecondTask(for surname: String?) -> Character? {
    guard let surname = surname,
        surname.count > 1 else { return nil }
    let index = surname.index(surname.startIndex, offsetBy: 1)
    let secondCharacter = surname[index]
    guard let number = convertToNumber(letter: secondCharacter) else { return nil }
    print("Вторая буква: \(secondCharacter), ее порядковый номер: \(number)")
    let modulo = number % 2
    print("Остаток от деления на 2 плюс 1 = \(modulo + 1)")
    switch modulo + 1 {
    case 1:
        return "А"
    case 2:
        return "Б"
    default:
        return nil
    }
}

func outputToConsole(for surname: String?) {
    if let firstTask = getNumberForFirstTask(for: surname) {
        print("1 ЗАДАЧА - \(firstTask).")
    } else {
        print("Не удалось определить пункт для 1 задачи.")
    }
    print()
    if let secondTask = getNumberForSecondTask(for: surname) {
        print("2 ЗАДАЧА -  \(secondTask).")
    } else {
        print("Не удалось определить пункт для 2 задачи.")
    }
    print()
}

let enteredSurname = readLine()?.uppercased()
outputToConsole(for: enteredSurname)

func askToContinue() {
    print("Хотите еще проверить фамилию? [да/нет]")
    if let response = readLine(),
        response == "да" {
        print("Введите свою фамилию:")
        let enteredSurname = readLine()?.uppercased()
        outputToConsole(for: enteredSurname)
        askToContinue()
    } else {
        exit(0)
    }
}
askToContinue()
