# FlightTicket
### О приложении:
Приложение является карманным помощником для контроля Вашего вылета. 
Вместе с командой опытных разработчиков, будем показывать Вам актуальную информацию по вылету, сообщать о задержках рейсов

## Скрины
![](https://github.com/VasyaOne/ScrenTicket/blob/main/ScreenForReadme/View02.jpf)

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
