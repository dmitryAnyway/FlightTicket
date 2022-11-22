# FlightTicket
### О приложении:
Приложение является карманным помощником для контроля Вашего вылета. 
Вместе с командой опытных разработчиков, будем показывать Вам актуальную информацию по вылету, сообщать о задержках рейсов

## Скрины:
<img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg.jpg" style="width: 150px"> <img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg-2.jpg" style="width: 150px"> <img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg-3.jpg" style="width: 150px"> <img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg-4.jpg" style="width: 150px"> <img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg-5.jpg" style="width: 150px"> <img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg-6.jpg" style="width: 150px"> 

## Как это работает:
в специальное поле вносится номер рейса и отслеживаете 

## Технологии:
Приложение написано на языке ***Swift***.
Так же использованы технологии реактивного программирования: 
- Alamofire
- Swinject
- Combine
- API Air

## Работа над проектом ведется с использованием tuist (https://tuist.io)
Этот инструмент помогает избежать merge конфликтов при командной разработке.
Его можно установить используя команду в терминале:
    curl -Ls https://install.tuist.io | bash 
После окончания установки, необходимо перейти в директорию проекта и написать команду:
    tuist generate 
для генерации .xcproject и .xcworkspace файлов.
Вся работа ведется в сгенерированном проекте.

## Локализация
В проекте используется английский язык как основной, при этом есть локализация на русский язык.

## Куски кода:
``` swift
 init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "PocketTicket")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
```
## Сложности в программировании:

## Команда разработчиков: 
- Тимлид - Дмитрий Зубарев
    - Разработчики: - Станислав, Андре Руссо, Василий Леонов
