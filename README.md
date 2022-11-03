# FlightTicket
### О приложении:
Приложение является карманным помощником для контроля Вашего вылета. 
Вместе с командой опытных разработчиков, будем показывать Вам актуальную информацию по вылету, сообщать о задержках рейсов

## Скрины
<img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg.jpg" style="width: 150px"> <img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg-2.jpg" style="width: 150px"> <img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg-3.jpg" style="width: 150px"> <img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg-4.jpg" style="width: 150px"> <img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg-5.jpg" style="width: 150px"> <img src="https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/2022%20%D0%A2%D1%83%D1%80%D1%86%D0%B8%D1%8F%20jpg-6.jpg" style="width: 150px"> 

## Как это работает:
в специальное поле вносится номер рейса и отслеживаете 

## Технологии
Приложение написано на языке ***Swift***.
Так же использованы технологии реактивного программирования: 
- Combaine
- Rx

## Куски кода
``` swift
 init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "PocketTicket")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
```

## Команда разработчиков: 
- Тимлид - Дмитрий
    - Разработчик 1 - Станислав
    - Разработчик 2 - Андре Руссо
    - Разработчик 3 - Василий Леонов
