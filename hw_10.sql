-- Homework-10 (DML statements)

/*
    1.  Перепишите и запустите данный statemenet для создания таблицы 
        locations2, которая будет содержать такие же столбцы, что и locations:
        CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1=2);
*/
    CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1=2);

/*
    2.  Добавьте в таблицу locations2 2 строки с информацией о id локации, 
        адресе, городе, id страны. Пусть данные строки относятся к стране 
        Италия.
*/
    INSERT INTO locations2 (location_id, street_address, city, country_id) 
    VALUES (3300, '2945 Via Sant Andrea', 'Milan', 'IT');
    
    INSERT INTO locations2 (location_id, street_address, city, country_id) 
    VALUES (3400, '9013 Via della liberta', 'Palermo', 'IT');
 
/*
    3.  Совершите commit.
*/
    COMMIT;

/*
    4.  Добавьте в таблицу locations2 ещё 2 строки, не используя 
        перечисления имён столбцов, в которые заносится информация. Пусть 
        данные строки относятся к стране Франция. При написании значений, 
        где возможно, используйте функции.
*/
    INSERT INTO locations2 
    VALUES (3500, '1718 Avenue du Maine', '75014', INITCAP('paris'), 'Province 1', UPPER('fr'));
    
    INSERT INTO locations2 
    VALUES (3600, '1920 Rue Appian', '69005', INITCAP('lyon'), 'Province 2', UPPER('fr'));

/*
    5.  Совершите commit.
*/
    COMMIT;

/*
    6.  Добавьте в таблицу locations2 строки из таблицы locations, в которых 
        длина значения столбца state_province больше 9.
*/
    INSERT INTO locations2 
    (SELECT * FROM locations WHERE LENGTH(state_province) > 9);

/*
    7.  Совершите commit.
*/
    COMMIT;

/*
    8.  Перепишите и запустите данный statemenet для создания таблицы 
        locations4europe, которая будет содержать такие же столбцы, что и 
        locations:
        CREATE TABLE locations4europe AS (SELECT * FROM locations WHERE 1=2);
*/
    CREATE TABLE locations4europe AS (SELECT * FROM locations WHERE 1=2);

/*
    9.  Одним statement-ом добавьте в таблицу locations2 всю информацию
        для всех строк из таблицы locations, а в таблицу locations4europe
        добавьте информацию о id локации, адресе, городе, id страны только
        для тех строк из таблицы locations, где города находятся в Европе. 
*/
    INSERT ALL
    WHEN 1=1 
    THEN 
    INTO locations2 
    VALUES (location_id, street_address, postal_code, city, 
            state_province, country_id)
    WHEN country_id IN (
            SELECT country_id FROM countries c 
            JOIN regions r ON (c.region_id = r.region_id) 
            WHERE region_name = 'Europe')
    THEN
    INTO locations4europe (location_id, street_address, city, country_id) 
    VALUES (location_id, street_address, city, country_id)
    SELECT * FROM locations;

/*
    10. Совершите commit.
*/
    COMMIT;

/*
    11. В таблице locations2 измените почтовый код на любое значение в тех 
        строках, где сейчас нет информации о почтовом коде.
*/
    UPDATE locations2 
    SET postal_code = '765321' 
    WHERE postal_code IS NULL;

/*
    12. Совершите rollback.
*/
    ROLLBACK;

/*
    13. В таблице locations2 измените почтовый код в тех строках, где сейчас 
        нет информации о почтовом коде. Новое значение должно быть кодом
        из таблицы locations для строки с id 2600.
*/
    UPDATE locations2 
    SET postal_code = (
            SELECT postal_code FROM locations 
            WHERE location_id = 2600) 
    WHERE postal_code IS NULL;

/*
    14. Совершите commit.
*/
    COMMIT;

/*
    15. Удалите строки из таблицы locations2, где id страны «IT».
*/
    DELETE FROM locations2 
    WHERE country_id = 'IT';

/*
    16. Создайте первый savepoint.
*/
    SAVEPOINT s1;

/*
    17. В таблице locations2 измените адрес в тех строках, где id локации 
        больше 2500. Новое значение должно быть «Sezam st. 18»
*/
    UPDATE locations2 
    SET street_address = 'Sezam st. 18' 
    WHERE location_id > 2500;

/*
    18. Создайте второй savepoint.
*/
    SAVEPOINT s2;

/*
    19. Удалите строки из таблицы locations2, где адрес равен «Sezam st. 18».
*/
    DELETE FROM locations2 
    WHERE street_address = 'Sezam st. 18';

/*
    20. Откатите изменения до первого savepoint.
*/
    ROLLBACK TO s1;

/*
    21. Совершите commit.
*/
    COMMIT;


