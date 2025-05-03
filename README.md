# GLD Token на TON

Этот проект реализует смарт-контракт токена GLD на сети TON с привязкой к цене золота через оракул.

## Контракты
- `Oracle` — публикует цену золота (в центах/тонкой валюте).
- `GldJettonMaster` — управляет выпуском токенов и обращается к оракулу.
- `GldJettonWallet` — пользовательский кошелёк GLD с поддержкой внутренних переводов.

## Установка
```bash
npm install -g tact-cli
tact init
```

## Компиляция
```bash
tact compile src/GldJettonMaster.tact
```

## Тесты
```bash
tact test
```

## Пример использования
```bash
tact run oracle update_price --args "1234"
tact run gldmaster price
```

## Лицензия
MIT