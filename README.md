# FlightTicket
### О приложении:
Приложение является карманным помощником для контроля Вашего вылета. 
Вместе с командой опытных разработчиков, будем показывать Вам актуальную информацию по вылету, сообщать о задержках рейсов

## Скрины
![](https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202022-11-03%20%D0%B2%2011.16.15.png)

## Как это работает:
в специальное поле вносится номер рейса и отслеживаете 

## Технологии
Приложение написано на языке ***Swift***
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
