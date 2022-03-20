INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('ст. Темрюк', 'ст. Тула', '3200', '480');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('г. Киров (Вятка)', 'клх Черский', '3700', '555');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('ст. Биробиджан', 'п. Абинск', '6700', '1005');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('с. Славянск-на-Кубани', 'г. Крымск', '6700', '1005');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('клх Томск', 'д. Александров', '5200', '780');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('г. Урус-Мартан', 'п. Североморск', '1200', '180');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('клх Ачхой Мартан', 'клх Лабытнанги', '2200', '330');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('г. Добрянка', 'клх Саров (Морд.)', '7700', '1155');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('клх Томпа', 'д. Хасан', '700', '105');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('д. Гагарин', 'к. Новомичуринск', '5700', '855');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('с. Шарья', 'с. Губаха', '6700', '1005');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('п. Анадырь', 'клх Голицыно', '3200', '480');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('г. Хатанга', 'д. Елабуга', '2200', '330');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('д. Кущевская', 'п. Зеленоград', '6200', '930');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('д. Лодейное Поле', 'к. Кижи', '3700', '555');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('с. Елец', 'клх Энгельс', '6700', '1005');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('д. Адлер', 'д. Каспийск', '6700', '1005');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('п. Ярославль', 'к. Радужный', '7200', '1080');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('п. Армавир', 'г. Александровск', '5200', '780');
INSERT INTO List (list_departure, list_arrive, list_length, list_fuel) VALUES('с. Краснокамск', 'д. Палана', '6700', '1005');
INSERT INTO Trip (trip_code, trip_time, trip_name, list_id) VALUES('GX8341', '15:00:00', 'Адлер—Каспийск', 17);
INSERT INTO Trip (trip_code, trip_time, trip_name, list_id) VALUES('MB9463', '23:10:00', 'Темрюк—Тула', 1);
INSERT INTO Trip (trip_code, trip_time, trip_name, list_id) VALUES('XE5010', '1 day, 4:10:00', 'Лодейное—Кижи', 15);
INSERT INTO Trip (trip_code, trip_time, trip_name, list_id) VALUES('MZ1269', '22:00:00', 'Томск—Александров', 5);
INSERT INTO Trip (trip_code, trip_time, trip_name, list_id) VALUES('QF2738', '8:30:00', 'Армавир—Александровск', 19);
INSERT INTO Trip (trip_code, trip_time, trip_name, list_id) VALUES('YR5401', '1 day, 1:10:00', 'Краснокамск—Палана', 20);
INSERT INTO Trip (trip_code, trip_time, trip_name, list_id) VALUES('KO2033', '12:10:00', 'Урус-Мартан—Североморск', 6);
INSERT INTO Trip (trip_code, trip_time, trip_name, list_id) VALUES('YG3432', '11:30:00', 'Добрянка—Саров', 8);
INSERT INTO Trip (trip_code, trip_time, trip_name, list_id) VALUES('YE6381', '11:00:00', 'Славянск-на-Кубани—Крымск', 4);
INSERT INTO Trip (trip_code, trip_time, trip_name, list_id) VALUES('HJ1600', '1 day, 7:00:00', 'Шарья—Губаха', 11);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('эконом', '7500', 4);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('комфорт', '24000', 4);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('бизнес', '80000', 4);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('эконом', '4000', 8);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('комфорт', '17000', 8);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('бизнес', '69500', 8);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('эконом', '8500', 3);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('комфорт', '25000', 3);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('бизнес', '60500', 3);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('эконом', '5500', 6);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('комфорт', '29500', 6);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('бизнес', '66500', 6);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('эконом', '9000', 7);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('комфорт', '22000', 7);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('бизнес', '64000', 7);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('эконом', '5500', 9);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('комфорт', '27000', 9);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('бизнес', '56000', 9);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('эконом', '6000', 1);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('комфорт', '29000', 1);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('бизнес', '75000', 1);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('эконом', '5000', 2);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('комфорт', '28500', 2);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('бизнес', '65500', 2);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('эконом', '5500', 10);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('комфорт', '29000', 10);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('бизнес', '79500', 10);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('эконом', '15000', 5);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('комфорт', '28500', 5);
INSERT INTO Price (price_rate, price_cost, trip_id) VALUES('бизнес', '57000', 5);
INSERT INTO Class (class_classif, class_summary, class_type) VALUES('первый', 'Aliquam aut consequuntur iste quasi soluta adipisci itaque. Excepturi et deserunt hic. Dignissimos voluptatem minima.', 'для региональный протяженности');
INSERT INTO Class (class_classif, class_summary, class_type) VALUES('бизнес', 'Facere itaque alias minus. Quisquam nam itaque sit distinctio.', 'для международный протяженности');
INSERT INTO Class (class_classif, class_summary, class_type) VALUES('эконом', 'Non harum ipsum molestias. Error nostrum quaerat nam.', 'для местный протяженности');
INSERT INTO Class (class_classif, class_summary, class_type) VALUES('эконом', 'Atque dignissimos repellendus. Odit aut dolorum ex sint. Culpa repellendus eos eum neque dolorem. Sapiente dignissimos voluptatibus harum laboriosam aperiam tempore pariatur.', 'для местный протяженности');
INSERT INTO Class (class_classif, class_summary, class_type) VALUES('бизнес', 'Corporis praesentium nemo aspernatur eaque sed. Amet laudantium accusamus voluptatem.
Doloremque nihil eos laboriosam odit cumque. Qui eum nostrum. Tenetur saepe autem assumenda numquam ex aut sed.', 'для региональный протяженности');
INSERT INTO Class (class_classif, class_summary, class_type) VALUES('бизнес', 'Non corrupti optio quas. Enim qui aliquam est.
Eveniet recusandae rem suscipit. Minus laboriosam atque laudantium voluptates in fuga.', 'для международный протяженности');
INSERT INTO Class (class_classif, class_summary, class_type) VALUES('первый', 'Sint quos veritatis voluptates corporis maiores.
Laborum accusamus dolorum maxime perferendis incidunt. Nemo dicta error repudiandae animi. Omnis blanditiis assumenda ipsa.', 'для международный протяженности');
INSERT INTO Class (class_classif, class_summary, class_type) VALUES('эконом', 'Earum optio odio neque. In quisquam at delectus assumenda non.
Esse doloribus maiores repellendus voluptatum aperiam. Quod at repellat natus asperiores inventore.', 'для местный протяженности');
INSERT INTO Class (class_classif, class_summary, class_type) VALUES('эконом', 'Optio dolorum repellat tempora excepturi. Debitis consectetur velit facere harum fuga. Illo eligendi et laudantium.', 'для международный протяженности');
INSERT INTO Class (class_classif, class_summary, class_type) VALUES('первый', 'Repudiandae ut cum pariatur nesciunt voluptatibus.
Dicta voluptas architecto laudantium eos eum.
Exercitationem a distinctio voluptate corrupti. Itaque quia aliquam blanditiis iste.', 'для местный протяженности');
INSERT INTO Crew (crew_captian, crew_navigator, crew_steward1, crew_steward2, crew_steward3, crew_level) VALUES('Пелагея Ильинична Самойлова', 'Зоя Владимировна Игнатьева', 'Прохоров Владлен Зиновьевич', 'Кондратьев Сидор Чеславович', 'Селезнев Нифонт Федотович', '3');
INSERT INTO Crew (crew_captian, crew_navigator, crew_steward1, crew_steward2, crew_steward3, crew_level) VALUES('Костин Константин Игоревич', 'Оксана Георгиевна Морозова', 'Зоя Захаровна Лебедева', 'Сигизмунд Архипович Пахомов', 'Прокл Валерианович Евдокимов', '2');
INSERT INTO Crew (crew_captian, crew_navigator, crew_steward1, crew_steward2, crew_steward3, crew_level) VALUES('Евпраксия Робертовна Вишнякова', 'Ульяна Оскаровна Дементьева', 'Ситникова Евгения Кузьминична', 'Савельева Анна Юльевна', 'Шубин Юлиан Ильясович', '2');
INSERT INTO Crew (crew_captian, crew_navigator, crew_steward1, crew_steward2, crew_steward3, crew_level) VALUES('Антип Данилович Тетерин', 'Ольга Тимофеевна Журавлева', 'Максимова Варвара Валериевна', 'Калашникова Лидия Робертовна', 'Ия Федоровна Меркушева', '2');
INSERT INTO Crew (crew_captian, crew_navigator, crew_steward1, crew_steward2, crew_steward3, crew_level) VALUES('Лавр Феофанович Морозов', 'Белоусов Доброслав Ануфриевич', 'Ия Викторовна Козлова', 'Никонова Алла Святославовна', 'Логинова Марфа Наумовна', '1');
INSERT INTO Crew (crew_captian, crew_navigator, crew_steward1, crew_steward2, crew_steward3, crew_level) VALUES('Алевтина Альбертовна Сазонова', 'Шестакова Майя Ефимовна', 'Сергеева Евдокия Георгиевна', 'Маслова Дарья Львовна', 'Лидия Геннадиевна Михайлова', '2');
INSERT INTO Crew (crew_captian, crew_navigator, crew_steward1, crew_steward2, crew_steward3, crew_level) VALUES('Орехов Филипп Богданович', 'Фока Алексеевич Кузнецов', 'Русаков Афанасий Абрамович', 'Лыткин Каллистрат Борисович', 'Исидор Владленович Ефимов', '1');
INSERT INTO Crew (crew_captian, crew_navigator, crew_steward1, crew_steward2, crew_steward3, crew_level) VALUES('Алексей Валентинович Моисеев', 'Павел Ильясович Юдин', 'Соколов Ерофей Владленович', 'Колобова Зинаида Игоревна', 'Макарова Зинаида Даниловна', '1');
INSERT INTO Crew (crew_captian, crew_navigator, crew_steward1, crew_steward2, crew_steward3, crew_level) VALUES('Фадей Феоктистович Архипов', 'Самойлов Симон Всеволодович', 'Иванна Андреевна Лыткина', 'Кириллова Тамара Богдановна', 'Викторин Витальевич Юдин', '3');
INSERT INTO Crew (crew_captian, crew_navigator, crew_steward1, crew_steward2, crew_steward3, crew_level) VALUES('Тетерин Захар Ефремович', 'Станислав Ефимьевич Федосеев', 'Сафонов Ян Юлианович', 'Александра Матвеевна Моисеева', 'Милица Макаровна Беляева', '1');
INSERT INTO Access_plane (crew_id, class_id) VALUES('10', '4');
INSERT INTO Access_plane (crew_id, class_id) VALUES('9', '8');
INSERT INTO Access_plane (crew_id, class_id) VALUES('4', '6');
INSERT INTO Access_plane (crew_id, class_id) VALUES('4', '4');
INSERT INTO Access_plane (crew_id, class_id) VALUES('3', '1');
INSERT INTO Access_plane (crew_id, class_id) VALUES('3', '6');
INSERT INTO Access_plane (crew_id, class_id) VALUES('10', '9');
INSERT INTO Access_plane (crew_id, class_id) VALUES('10', '1');
INSERT INTO Access_plane (crew_id, class_id) VALUES('1', '7');
INSERT INTO Access_plane (crew_id, class_id) VALUES('9', '10');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('большой', '198', '2');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('средней', '156', '5');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('малой', '95', '7');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('малой', '89', '4');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('малой', '96', '6');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('малой', '83', '1');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('средней', '156', '4');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('большой', '198', '6');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('малой', '96', '10');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('большой', '198', '1');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('малой', '96', '4');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('средней', '156', '10');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('малой', '96', '3');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('малой', '96', '10');
INSERT INTO Plane (plane_type, plane_places, class_id) VALUES('большой', '198', '6');
INSERT INTO Flight (flight_departure, flight_arrive, crew_id, trip_id, plane_id) VALUES('2021-11-17 13:10', '2021-11-18 00:10', '2', 9, '6');
INSERT INTO Flight (flight_departure, flight_arrive, crew_id, trip_id, plane_id) VALUES('2022-02-08 03:20', '2022-02-09 04:30', '2', 6, '12');
INSERT INTO Flight (flight_departure, flight_arrive, crew_id, trip_id, plane_id) VALUES('2022-03-16 17:40', '2022-03-17 05:10', '2', 8, '6');
INSERT INTO Flight (flight_departure, flight_arrive, crew_id, trip_id, plane_id) VALUES('2021-10-24 18:40', '2021-10-25 09:40', '10', 1, '8');
INSERT INTO Flight (flight_departure, flight_arrive, crew_id, trip_id, plane_id) VALUES('2022-03-01 14:30', '2022-03-01 23:00', '2', 5, '11');
INSERT INTO Flight (flight_departure, flight_arrive, crew_id, trip_id, plane_id) VALUES('2022-06-12 15:50', '2022-06-13 22:50', '5', 10, '5');
INSERT INTO Flight (flight_departure, flight_arrive, crew_id, trip_id, plane_id) VALUES('2021-12-08 20:00', '2021-12-09 08:10', '1', 7, '2');
INSERT INTO Flight (flight_departure, flight_arrive, crew_id, trip_id, plane_id) VALUES('2021-10-19 05:00', '2021-10-20 09:10', '8', 3, '12');
INSERT INTO Flight (flight_departure, flight_arrive, crew_id, trip_id, plane_id) VALUES('2022-05-01 17:20', '2022-05-02 16:30', '6', 2, '1');
INSERT INTO Flight (flight_departure, flight_arrive, crew_id, trip_id, plane_id) VALUES('2021-11-04 09:50', '2021-11-05 07:50', '6', 4, '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Тарасов Андрей Архипович', '5101 431525', 'W93', '3', '2');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Воронов Пахом Ааронович', '0915 468959', 'A69', '15', '8');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Казаков Эрнест Александрович', '6921 989022', 'A114', '24', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Аскольд Иосифович Кириллов', '0302 921421', 'N44', '15', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Софрон Харитонович Андреев', '8816 648362', 'T117', '29', '2');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Беляев Александр Георгиевич', '9417 415171', 'O148', '23', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Екатерина Ниловна Логинова', '4002 627229', 'I32', '5', '5');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Турова Ангелина Рудольфовна', '2309 655679', 'R126', '30', '8');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Будимир Абрамович Терентьев', '5619 829515', 'P23', '17', '8');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('г-н Сафонов Вячеслав Евсеевич', '7801 821962', 'V69', '21', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Никанор Еремеевич Чернов', '6913 207599', 'R81', '20', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Андреев Иннокентий Филимонович', '9010 912213', 'T97', '2', '10');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Емельянов Макар Измаилович', '4211 737946', 'Q108', '18', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Филимон Эдгардович Горбунов', '2907 602802', 'X86', '29', '8');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Терентьева Вероника Ждановна', '7705 493027', 'M73', '19', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Элеонора Егоровна Селиверстова', '8807 379305', 'B77', '3', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Бобров Владлен Адрианович', '6108 500399', 'P15', '13', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Потап Гордеевич Веселов', '3014 039872', 'K40', '1', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Маргарита Юрьевна Морозова', '7911 728328', 'C26', '8', '6');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Калинина Вероника Романовна', '5220 216224', 'H128', '17', '10');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Пахомов Руслан Еремеевич', '6212 978190', 'N47', '23', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Евдоким Афанасьевич Игнатьев', '7703 894810', 'R87', '2', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Рогов Федосий Борисович', '4116 244510', 'U72', '19', '10');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Колесников Всеволод Иосифович', '9609 319305', 'Y115', '6', '8');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Кондрат Богданович Николаев', '7805 997080', 'H36', '11', '3');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Блинов Григорий Филатович', '9310 284006', 'Y15', '27', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Галкина Феврония Станиславовна', '7320 772764', 'O104', '26', '8');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Лариса Афанасьевна Шубина', '0616 844354', 'D28', '8', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Рябова Вера Валериевна', '8915 864239', 'W106', '9', '10');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('тов. Самсонова Татьяна Ефимовна', '1012 162719', 'P65', '19', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Савельева Оксана Матвеевна', '7115 635715', 'P37', '27', '8');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Варвара Болеславовна Васильева', '1218 982990', 'Q94', '1', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Адам Ефстафьевич Сысоев', '7606 423480', 'X18', '7', '2');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Меркушев Всеслав Даниилович', '5907 232718', 'M14', '19', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Архипова Регина Яковлевна', '6809 141166', 'R39', '20', '6');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Соловьева Вероника Ждановна', '2918 772665', 'Y52', '15', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Светлана Харитоновна Брагина', '1316 788555', 'E135', '3', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Бирюкова Галина Семеновна', '9001 458232', 'D47', '30', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Екатерина Тимуровна Шашкова', '8707 990598', 'C53', '16', '5');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Ширяева Валерия Антоновна', '1107 026561', 'M131', '16', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Семен Эдуардович Осипов', '4808 536417', 'Y114', '10', '6');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Будимир Иосипович Гордеев', '7201 508656', 'P98', '21', '3');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Шаров Антонин Авдеевич', '8419 286487', 'B57', '19', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Тимофей Антипович Блинов', '2215 801154', 'G131', '23', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Гусева Зинаида Филипповна', '7321 687821', 'B40', '24', '5');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Носкова Прасковья Романовна', '0217 523266', 'K43', '8', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Суханов Аникей Викторович', '8501 712516', 'S144', '1', '6');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Анисимов Ефим Демидович', '9418 976371', 'Y138', '27', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('г-н Фадеев Никита Елизарович', '0103 741109', 'Q73', '4', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Рожков Вадим Фокич', '8114 344909', 'G105', '3', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Ольга Сергеевна Горбунова', '1009 907741', 'V75', '2', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Архипова Татьяна Павловна', '4520 633977', 'Y110', '8', '6');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Киселева Акулина Антоновна', '0520 313990', 'Y108', '1', '6');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Гурьева Таисия Робертовна', '6414 781264', 'S27', '11', '2');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Зайцев Милан Феликсович', '4117 014742', 'Z72', '9', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Евлампий Денисович Силин', '4520 107173', 'W31', '17', '6');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Ульяна Афанасьевна Лебедева', '0521 822797', 'G2', '6', '2');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Лариса Руслановна Гущина', '5221 421374', 'Z114', '10', '3');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Авдеев Лазарь Ильич', '5003 053271', 'C21', '12', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Воронцов Ян Анисимович', '8417 855384', 'P128', '20', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Наталья Аскольдовна Молчанова', '4004 037452', 'O119', '14', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Шилова Маргарита Артемовна', '6306 148189', 'B106', '8', '5');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Филиппов Герман Владиленович', '4019 921413', 'M50', '22', '8');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Евдокимов Олег Феофанович', '3908 048755', 'G70', '30', '6');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Матвеева Екатерина Олеговна', '9407 938825', 'W31', '14', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Нонна Вячеславовна Исаева', '6913 539919', 'W14', '22', '3');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Тамара Игоревна Блинова', '3006 048105', 'T73', '13', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Виктория Юрьевна Сорокина', '5803 411477', 'L45', '12', '2');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Андреев Арсений Антипович', '9721 391227', 'U60', '15', '8');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Андреев Фока Давидович', '5316 569290', 'V71', '17', '10');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('тов. Куликов Ратмир Федосьевич', '1105 964777', 'Y117', '24', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Ермаков Демьян Арсенович', '8206 519505', 'S112', '4', '6');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Будимир Зиновьевич Красильников', '6002 216779', 'O111', '14', '5');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Демид Бориславович Сазонов', '1009 186519', 'A23', '29', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Светлана Харитоновна Князева', '7809 273766', 'Q6', '6', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Медведева Татьяна Архиповна', '2603 418053', 'Q16', '26', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Ярополк Викторович Куликов', '2413 994971', 'W75', '28', '5');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Яков Авдеевич Гордеев', '4801 386566', 'Y57', '22', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Савин Конон Борисович', '9303 128105', 'C41', '21', '10');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Олимпий Тимурович Андреев', '1404 818412', 'L65', '22', '10');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Сильвестр Демьянович Кузьмин', '6501 395460', 'K32', '29', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Наум Харлампьевич Брагин', '5915 078159', 'W89', '10', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Герасимов Артемий Бориславович', '9515 914114', 'I64', '26', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Носков Савватий Виленович', '7016 186373', 'S60', '20', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Митофан Иларионович Борисов', '0618 484057', 'H62', '15', '10');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Еремей Бориславович Нестеров', '8210 304899', 'I60', '2', '3');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Котова Октябрина Львовна', '9705 463741', 'G92', '9', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Синклитикия Юрьевна Игнатьева', '7019 641473', 'H120', '1', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Петрова Евдокия Эльдаровна', '5918 873769', 'Q76', '30', '2');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Фаина Юльевна Цветкова', '5720 884171', 'M56', '25', '5');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Алина Львовна Герасимова', '1606 191974', 'E63', '27', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Зимина Виктория Натановна', '7609 161140', 'O4', '16', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Мамонтов Емельян Ерофеевич', '5606 808592', 'L73', '26', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Андрей Игнатович Уваров', '8410 066673', 'Z6', '6', '10');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Таисия Максимовна Блинова', '2609 682800', 'V142', '5', '3');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Эмилия Артемовна Мартынова', '9014 215228', 'L143', '16', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Носова Оксана Георгиевна', '4818 590433', 'O12', '22', '6');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Мухина Евфросиния Викторовна', '4216 792411', 'T16', '6', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Панфилов Феоктист Иосипович', '5619 270449', 'W45', '26', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Потапов Григорий Фокич', '6714 181391', 'Z78', '6', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Третьякова Елена Кузьминична', '2415 109677', 'W32', '9', '3');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Мария Васильевна Гурьева', '3119 242039', 'G81', '4', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Ермакова Лукия Александровна', '9221 457530', 'M123', '4', '10');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Пелагея Ильинична Сергеева', '6521 474145', 'E54', '15', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Лариса Святославовна Лобанова', '2607 291264', 'R104', '18', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Орлова Юлия Кирилловна', '8713 815370', 'A53', '9', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Капустина Лора Феликсовна', '5713 795109', 'A49', '27', '4');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Баранова Вера Ждановна', '2219 046178', 'M71', '21', '8');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Агафон Евстигнеевич Копылов', '0311 538714', 'D52', '7', '2');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Кабанов Анисим Бориславович', '5421 089159', 'Q102', '29', '6');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('тов. Никитин Георгий Феофанович', '0908 613343', 'U6', '9', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Зыков Куприян Германович', '3320 548601', 'O89', '8', '5');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Марина Кузьминична Журавлева', '9415 637817', 'P49', '28', '1');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Баранова Валентина Семеновна', '4408 194280', 'Q143', '24', '9');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Кондратьева Наталья Кузьминична', '2921 635207', 'X9', '23', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Иванна Петровна Васильева', '0615 171159', 'F36', '21', '3');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Алла Геннадиевна Калашникова', '6716 870420', 'O68', '30', '7');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Наина Леонидовна Колесникова', '8612 047006', 'I84', '14', '10');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('г-жа Дорофеева Регина Артемовна', '3014 547555', 'F69', '24', '5');
INSERT INTO Passenger (passenger_name, passenger_passport, passenger_number, price_id, flight_id) VALUES('Захарова Ангелина Кузьминична', '2720 264669', 'N142', '21', '6');
