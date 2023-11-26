# task_ms

- Малинин Константин
- Тестовое задание Flutter

## Описание проекта

При первом входе пользователь попадает на страницу сохраненных городов. Чтобы выбрать город
необходимо нажать иконку поиска в AppBar и начать писать название города или района. Затем выбрать
из списка предложенных местоположений необходимое. Первый город сохраняется автоматически и
пользователя перенаправляет на страницу погоды выбранного города. Чтобы найти другое местоположение
или посмотреть список сохраненных городов со страницы погоды, необходимо нажать на иконку города в
правом верхнем углу AppBar. Чтобы удалить или добавить город в избранное, необходимо со страницы
погоды нажать на иконку избранного в левом верхнем углу AppBar. При удалении основного города из
избранного при последующих входах в приложение будет показана погода следующего за ним в списке
избранных городов. При удалении всего списка сохраненных городов при следующем входе пользователя
перенаправит на странницу выбора города, как при первом входе.

## Описание, как запустить проект

Для запуска проекта необходимо установить пакеты из файла "pubspec.yaml" командой "pub get", затем в терминале IDE выполнить команду
"flutter packages pub run build_runner build --delete-conflicting-outputs" и выполнить запуск.

- Версия Dart 3.1.5
- Версия Flutter 3.13.9
