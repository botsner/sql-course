-- Homework-5 (CONVERSION, GENERAL, CONDITIONAL functions)

/*
    1.  Используя функции, получите список всех сотрудников у которых в 
        имени есть буква 'b' (без учета регистра).
*/
    SELECT * FROM employees
    WHERE INSTR(LOWER(first_name), 'b') > 0;

/*
    2.  Используя функции, получите список всех сотрудников у которых в 
        имени содержатся минимум 2 буквы 'a'.
*/
    SELECT * FROM employees
    WHERE INSTR(LOWER(first_name), 'a', 1, 2) > 0;

/*
    3.  Получите первое слово из имени департамента, для тех департаментов, 
        у которых название состоит больше, чем из одного слова.
*/
    SELECT SUBSTR(department_name, 1, INSTR(department_name, ' ') - 1)
    FROM departments
    WHERE INSTR(department_name, ' ') > 0;

/*
    4.  Получите имена сотрудников без первой и последней буквы в имени.
*/
    SELECT first_name, 
        SUBSTR(first_name, 2, LENGTH(first_name) - 2) AS new_name
    FROM employees;

/*
    5.  Получите список всех сотрудников, у которых в значении job_id после 
        знака '_' как минимум 3 символа, но при этом это значение после '_' не 
        равно 'CLERK'.
*/
    SELECT * FROM employees
    WHERE LENGTH(SUBSTR(job_id, INSTR(job_id, '_') + 1)) >= 3
      AND SUBSTR(job_id, INSTR(job_id, '_') + 1) != 'CLERK';

/*
    6.  Получите список всех сотрудников, которые пришли на работу в 
        первый день любого месяца.
*/
    SELECT * FROM employees
    WHERE TO_CHAR(hire_date, 'DD') = '01';

/*
    7.  Получите список всех сотрудников, которые пришли на работу в 
        2008-ом году.
*/
    SELECT * FROM employees
    WHERE TO_CHAR(hire_date, 'YYYY') = '2008';

/*
    8.  Покажите завтрашнюю дату в формате: Tomorrow is Second day of January
*/
    SELECT TO_CHAR(SYSDATE + 1, 'fm"Tomorrow is" DdSPTH "day of" Month') AS info
    FROM dual;

/*
    9.  Выведите имя сотрудника и дату его прихода на работу в формате: 
        21st of June, 2007
*/
    SELECT first_name,
        TO_CHAR(hire_date, 'fmddTH "of" Month, YYYY') AS hire_date
    FROM employees;

/*
    10. Получите список работников с увеличенными зарплатами на 20%. 
        Зарплату показать в формате: $28,800.00
*/
    SELECT first_name, 
        TO_CHAR(salary * 1.2, '$999,999.00') AS new_salary
    FROM employees;

/*
    11. Выведите актуальную дату (нынешнюю), + секунда, + минута, + час, + 
        день, + месяц, + год. (Всё это по отдельности прибавляется к 
        актуальной дате).
*/
    SELECT SYSDATE                      now, 
        SYSDATE + 1 / (24 * 60 * 60)    plus_second,
        SYSDATE + 1 / (24 * 60)         plus_minute,
        SYSDATE + 1 / 24                plus_hour,
        SYSDATE + 1                     plus_day,
        ADD_MONTHS(SYSDATE, 1)          plus_month,
        ADD_MONTHS(SYSDATE, 12)         plus_year
    FROM dual;

/*
    12. Выведите имя сотрудника, его з/п и новую з/п, которая равна старой 
        плюс это значение текста «$12,345.55».
*/
    SELECT first_name, 
        salary,
        salary + TO_NUMBER('$12,345.55', '$99,999.99') AS new_salary
    FROM employees;

/*
    13. Выведите имя сотрудника, день его трудоустройства, а также 
        количество месяцев между днём его трудоустройства и датой, которую 
        необходимо получить из текста «SEP, 18:45:00 18 2009».
*/
    SELECT first_name, 
        hire_date,
        MONTHS_BETWEEN(
            TO_DATE('SEP, 18:45:00 18 2009', 'MON, HH24:SS:MI DD YYYY'), 
            hire_date
        ) AS months_count
    FROM employees;

/*
    14. Выведите имя сотрудника, его з/п, а также полную з/п (salary + 
        commission_pct(%)) в формате: $24,000.00
*/
    SELECT first_name, 
        salary, 
        TO_CHAR(
            salary + salary * NVL(commission_pct, 0), 
            '$999,999.99'
        ) AS full_salary
    FROM employees;
        

/*
    15. Выведите имя сотрудника, его фамилию, а также выражение «different 
        length», если длина имени не равна длине фамилии или выражение 
        «same length», если длина имени равна длине фамилии. Не 
        используйте conditional functions.
*/
    SELECT first_name, 
        last_name, 
        NVL2(
            NULLIF(LENGTH(first_name), LENGTH(last_name)), 
            'different length', 
            'same length'
        ) AS equality
    FROM employees;

/*
    16. Выведите имя сотрудника, его комиссионные, а также информацию о 
        наличии бонусов к зарплате – есть ли у него комиссионные (Yes/No).
*/
    SELECT first_name, 
        commission_pct, 
        NVL2(commission_pct, 'Yes', 'No') AS has_bonus
    FROM employees;

/*
    17. Выведите имя сотрудника и значение которое его будет 
        характеризовать: значение комиссионных, если присутствует, если нет, 
        то id его менеджера, если и оно отсутствует, то его з/п.
*/
    SELECT first_name, 
        COALESCE(commission_pct, manager_id, salary) AS info
    FROM employees;

/*
    18. Выведите имя сотрудника, его з/п, а также уровень зарплаты каждого 
        сотрудника: Меньше 5000 считается Low level, Больше или равно 5000 
        и меньше 10000 считается Normal level, Больше или равно 10000 
        считается High level.
*/
    SELECT first_name, 
        salary, 
        CASE
            WHEN salary < 5000 THEN 'Low level'
            WHEN salary >= 5000 AND salary < 10000 THEN 'Normal level'
            WHEN salary >= 10000 THEN 'High level'
        END AS salary_level
    FROM employees;

/*
    19. Для каждой страны показать регион, в котором она находится: 1-
        Europe, 2-America, 3-Asia, 4-Africa . Выполнить данное задание, 
        не используя функционал JOIN. Используйте DECODE.
*/
    SELECT country_name, 
        DECODE(region_id, 
            1, 'Europe', 
            2, 'America', 
            3, 'Asia', 
            4, 'Africa',
            'Unknown'
        ) AS region
    FROM countries;

/*
    20. Задачу №19 решите используя CASE.
*/
    SELECT country_name,
        CASE region_id
            WHEN 1 THEN 'Europe'
            WHEN 2 THEN 'America'
            WHEN 3 THEN 'Asia'
            WHEN 4 THEN 'Africa'
            ELSE 'Unknown'
        END AS region
    FROM countries;

/*
    21. Выведите имя сотрудника, его з/п, а также уровень того, насколько у 
        сотрудника хорошие условия: 
        - BAD: з/п меньше 10000 и отсутствие комиссионных;
        - NORMAL: з/п между 10000 и 15000 или, если присутствуют 
        комиссионные;
        - GOOD: з/п больше или равна 15000.
*/
    SELECT first_name, 
        salary,
        CASE 
            WHEN salary < 10000 AND commission_pct IS NULL THEN 'BAD'
            WHEN salary BETWEEN 10000 AND 15000 
              OR commission_pct IS NOT NULL THEN 'NORMAL'
            WHEN salary >= 15000 THEN 'GOOD'
        END AS work_conditions
    FROM employees;


