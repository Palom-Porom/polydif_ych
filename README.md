# PolydifYch

 Полидифыч - это библиотека на Ruby для символьного диффериенциирования полиномов 

## Установка и использование

#### Перед использованием нужно установить bundle(!):
```ruby
bundle install
```

#### Подключение библиотеки
```ruby
require_relative "../lib/polydif_ych"
```

#### Символьное дифференциирование полинома

```ruby
  res = PolydifYch.polydif "x^2+4*x+3+y", "x" 
```

## Вклад в сообщество

Баг-репорты и pull request-ы крайне приветствуются на https://github.com/Palom-Porom/polydif_ych.

## Лицензия

Гем доступен по open source лицензии в рамках [MIT License](https://opensource.org/licenses/MIT).