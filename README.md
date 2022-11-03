# FlightTicket
### О приложении:
Приложение является карманным помощником для контроля Вашего вылета. 
Вместе с командой опытных разработчиков, будем показывать Вам актуальную информацию по вылету, сообщать о задержках рейсов
 
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

## Скрины
![](<image src="https://disk.yandex.ru/client/recent?idApp=client&dialog=slider&idDialog=%2Fdisk%2F%D0%A1%D0%BA%D1%80%D0%B8%D0%BD%D1%88%D0%BE%D1%82%D1%8B%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202022-11-03%20%D0%B2%2011.15.09.png"></image>)
## Как это работает:
в специальное поле вносится номер рейса и отслеживаете 

## Команда разработчиков: 
- Тимлид - Дмитрий
    - Разработчик 1 - Станислав
    - Разработчик 2 - Андре Руссо
    - Разработчик 3 - Василий Леонов
