[:arrow_backward:Назад (Back)](https://github.com/Bloodies/HSE-University-projects/tree/master/Course-2/AaDS%20(Algorithms%20and%20data%20structures)/Algorithms%20Practice%20(ITMO))  
[:rewind:В корневую папку (In root folder)](https://github.com/Bloodies/HSE-University-projects)  

Задание взято с сайта с онлайн курсами ([openedu.ru](https://courses.openedu.ru))

# Задние 3 "Скобочная последовательность" (4 неделя)
| Имя входного файла: | input.txt |
|:--------------------:|:----------:|
| Имя выходного файла: | output.txt |
| Ограничение по времени: | 2 секунды |
| Ограничение по памяти: | 256 мегабайт |

Последовательность A, состоящую из символов из множества «(», «)», «[» и «]», назовем правильной скобочной последовательностью, если выполняется одно из следующих утверждений:

* A — пустая последовательность;
* первый символ последовательности A — это «(», и в этой последовательности существует такой символ «)», что последовательность можно представить как ![none](https://github.com/Bloodies/University.Projects/blob/master/Course%202/AaDS%20(Algorithms%20and%20data%20structures)/Algorithms%20Practice%20(ITMO)/Resources/txt_w4_t3_1.png) — правильные скобочные последовательности;
* первый символ последовательности A — это «[», и в этой последовательности существует такой символ «]», что последовательность можно представить как ![none](https://github.com/Bloodies/University.Projects/blob/master/Course%202/AaDS%20(Algorithms%20and%20data%20structures)/Algorithms%20Practice%20(ITMO)/Resources/txt_w4_t3_2.png) и  — правильные скобочные последовательности.

Так, например, последовательности «(())» и «()[]» являются правильными скобочными последовательностями, а последовательности «[)» и «((» таковыми не являются.

Входной файл содержит несколько строк, каждая из которых содержит последовательность символов «(», «)», «[» и «]». Для каждой из этих строк выясните, является ли она правильной скобочной последовательностью.
__________________
Формат входного файла  
Первая строка входного файла содержит число ![none](https://github.com/Bloodies/HSE-University-projects/blob/master/Course-2/AaDS%20(Algorithms%20and%20data%20structures)/Algorithms%20Practice%20(ITMO)/Resources/txt_w4_t3_3.png) - число скобочных последовательностей, которые необходимо проверить. Каждая из следующих N строк содержит скобочную последовательность длиной от  до  включительно. В каждой из последовательностей присутствуют только скобки указанных выше видов.

Формат выходного файла  
Для каждой строки входного файла (кроме первой, в которой записано число таких строк) выведите в выходной файл «YES», если соответствующая последовательность является правильной скобочной последовательностью, или «NO», если не является.

Пример

![none](https://github.com/Bloodies/HSE-University-projects/blob/master/Course-2/AaDS%20(Algorithms%20and%20data%20structures)/Algorithms%20Practice%20(ITMO)/Resources/format_w4_t3.png)
__________________
Результат

![none](https://github.com/Bloodies/HSE-University-projects/blob/master/Course-2/AaDS%20(Algorithms%20and%20data%20structures)/Algorithms%20Practice%20(ITMO)/Resources/result_w4_t3.png)