## Задача 7

Тут на самом деле целый мешок банок с клеем, надо разобраться, какой будет самым липким.

Они все пронумерованы, просто скажи мне номер нужной баночки. Можешь вычислить? Либо можно расшифровать записи отца из шкафа в подвале.

Смотри, тут на каждой баночке с клеем написаны номера нескольких баночек, которые будут более липкими, чем имеющаяся. Надо найти баночку с самым липким содержимым. Можешь посчитать сумму номеров баночек, которые надо проверить?

Тут всего 50000 баночек, вот файл со всеми данными. В строках после первой (таких строк будет ровно 50000) будет написано сначала количество банок в строке (обозначим за m), а затем m чисел через пробел. Каждое из чисел k в i-й строке означает, что банка с номером i менее липкая, чем банка с номером k.

### Пример

Дано число `n` в первой строке, в следующих `n` строках написано сначала количество банок в строке (обозначим за `m`), а затем `m` чисел через пробел - каждое из чисел `k` в `i`-й строке означает, что банка с номером `i` менее липкая, чем банка с номером `k`.

Пример файла:
```
3
2 2 3
0
0
```

В этом тесте банка с номером 2 и банка с номером 3 более липкие, чем банка 1. Как соотносятся 2 и 3 мы не знаем, придется проверить обе банки. Сумма их номеров равна 5.