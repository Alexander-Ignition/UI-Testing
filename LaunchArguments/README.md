#  UI тесты на iOS / Аргументы запуска приложения

Один из первых вопросов при UI тестировании — как передавать параметры извне для настройки приложения.

- Это может быть связано с невозможностью протестировать часть функционала на симуляторе.
- Передать конфигурацию или или фича флаги.
- Настроить URL для общения с сервером.
- Установить или стереть авторизационные данные.

## Установка аргументов

### XCUIApplication

Для передачи аргументов из UI тестов в приложение достаточно воспользоваться свойством `launchArguments`.

```swift
// AppUITests Target
let app = XCUIApplication()
app.launchArguments = [
  "-is_ui_test", "1",
  "-animation_speed", "100"
]
app.launch()
```

`launchArguments` - это массив строк.

Для передачи значения оно должно стоять сразу после ключа `"-animation_speed", "100"`, после них может идти следующий ключ и его значение.

### Xсode

`launchArguments` тоже самое, что и **Arguments Passed On Launch** указанные в Xcode Scheme.

Мы можем вручную прописать для нужной нам схемы аргументы, которые Xcode передаст при запуске приложения. Это может помочь в отладке приложения.

Для настройки аргументов откройте в Xcode ...

**Select Scheme / Edit Scheme... / Run /  Arguments / Arguments Passed On Launch**

![Xcode scheme settings](Images/xcode_scheme.png)

Как видно из картинки мы можем динамически включать и отключать аргументы запуска для отладки приложения без запуска UI тестов.

## Чтение аргументов

Что ж, как передать аргументы мы разобрались. Для их использования внутри приложения у нас есть два пути: `ProcessInfo` и `UserDefaults`

### ProcessInfo

В `ProcessInfo` доступны абсолютно все аргументы.
Но для их извлечения придется повозится с массивом.

```swift
// AppUITests Target
let app = XCUIApplication()
app.launchArguments = ["-my_argument", "test_value", "-is_ui_test"]
app.launch()

// App Target
let arguments = ProcessInfo.processInfo.arguments
let isUITest = arguments.contains("-is_ui_test")
let value = arguments
    .firstIndex(of: "-my_argument")
    .map { arguments[arguments.index(after: $0)] }
```
Но хорошо что есть более удобная альтернатива — `UserDefaults`.

### UserDefaults

`UserDefaults` куда удобнее в работе чем  `ProcessInfo`, потому что их интерфейс похож на словарь.

Но у `UserDefaults` есть неочевидное ограничение: они читают аргументы только начинающиеся с `-`.

Например если аргумент передать как `-my_argument`,
то из `UserDefaults` этот аргумент можно будет достать по ключу `my_argument`.

```swift
// AppUITests Target
let app = XCUIApplication()
app.launchArguments = ["-my_argument", "test_value"]
app.launch()

// App Target
let value = UserDefaults.standard.string(forKey: "my_argument")
```

`UserDefaults`  могут правильно преобразовать строки из аргументов запуска приложения в нужный тип.

Например версию онбординга из строки в число.

```swift
// AppUITests Target
let app = XCUIApplication()
app.launchArguments = ["-onbording_version", "12"]
app.launch()

// App Target
let version = UserDefaults.standard.integer(forKey: "onbording_version")
```

## Рекомендации

- Минимизируйте количество настраиваемых аргументов через тесты, чтобы ваше приложение максимально возможно соответствовало релизной версии.
- Оборачивайте куски кода использующего аргументы из UI тестов в блоки ``#if DEBUG` (или другой ваш аналог), чтобы код не попал в релиз.
- В UI тестах выделяйте `LaunchArguments`  способные правильно настроить аргументы запуска  `XCUIApplication`.
- Если ваше приложение уже использует UserDefaults для передачи аргументов, и вам нужно их переопределять в тестах, то используйте `UserDefaults` с аналогичными названия аргументов, а не `ProcessInfo`.
