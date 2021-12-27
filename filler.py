from random import choice
from datetime import datetime, timedelta
from pprint import pprint

from faker import Faker
from db import fetch_many, fetch_by_id

class MainFaker:

    def __init__(self):
        self.f = Faker("ru_RU")
        self.set_of_unique = set()
        self.sex = ''
    
    def id(self):
        id = self.f.random_int(min=1, max=10**4-1)
        while id in self.set_of_unique:
            id = self.f.random_int(min=1, max=10**4-1)
        self.set_of_unique.add(id)
        return str(id)

    def name(self):
        if self.gender() == 'М':
            return self.f.name_male()
        return self.f.name_female()

    def gender(self):
        if self.sex:
            temp = self.sex
            self.sex = ''
            return temp

        self.sex = self.f.random_element(['М', 'Ж'])
        return self.sex

    def tel(self):
        return self.f.phone_number()

    def addr(self):
        return self.f.address()

    def dob(self):
        return self.f.date_of_birth()

    def passport(self):
        ser_prefix = self._upgrade_int(
                self.f.random_int(min=1, max=99))
        ser_suffix = self._upgrade_int(
                self.f.random_int(min=1, max=21))
        number = self._upgrade_int(
                self.f.random_int(min=1, max=10**6-1), 
                6,
        )
        return ser_prefix + ser_suffix + ' ' + number

    def inn(self):
        return self.f.random_int(min=10**6, max=10**7-1)

    def date(self):
        return self.f.date_between(start_date='-5y', end_date='-4m')
    
    def text(self):
        """Return lorem ipsum"""
        return Faker('la').text()

    def _get_methods(self):
        methods = {}
        for attr in dir(self):
            method = getattr(self, attr)
            if not attr.startswith('_') and callable(method):
                methods[attr] = method
        return methods


    @staticmethod
    def _upgrade_int(x, length=2):
        if x < 10**length:
            return ((length-len(str(x)))*'0' + str(x))
        return str(x)

class SatieFaker(MainFaker):

    def __init__(self):
        super().__init__()
        self.unique = {
            'sub_name': set(),
            'hall': set(),
            'timetable': set(),
        }
        self.id = ''
        self._sub_name = ''
        self._timetable = (
            'Пн-Пт, 6:00-21:00, Сб-Вс, 8:00-23:00',
            'Пн-Пт, 7:00-21:00, Сб-Вс, 8:00-22:00',
            'Ежедневно, 7:00-23:00',
            'Ежедневно, 8:00-22:00',
            'Ежедневно, 9:00-22:00',
            'Ежедневно, 9:00-21:00',
        )

        self.subscription = {
            'Разовый (по выбору)': '800',
            'Месячный (4 занятия)': '2000',
            'Месячный (8 занятий)': '3500',
            'Месячный (безлимит)': '5000',
            'Полугодовой (безлимит)': '9000',
            'Годовой (безлимит)': '15000',
        }

        self.halls_services = {
            'Бассейн': (
                'Бассейн',
            ),
            'Тренажерный зал': (
                'Тренажерный зал',
            ),
            'Фитнес зал': (
                'Взрослый фитнес',
                'Детский фитнес',
            ),
            'Спортзал': (
                'Бокс',
                'Айкидо',
                'Дзюдо',
                'Карате',
                'Ушу',
            ),
            'Групповой зал': (
                'Групповые программы',
                'Игривые виды спорта',
            ),
            'Детская комната': (
                'Детская комната',
            ),
        }
    
    def hall(self):
        hall = self.f.random_element(self.halls_services.keys())
        while hall in self.unique['hall'] and len(self.unique['hall']) != len(self.halls_services.keys()):
            hall = self.f.random_element(self.halls_services.keys())
        self.unique['hall'].add(hall)
        
        return hall

    def timetable(self):
        timetable = self.f.random_element(self._timetable)
        while timetable in self.unique['timetable'] and len(self.unique['timetable']) != len(self._timetable):
            timetable = self.f.random_element(self._timetable)
        self.unique['timetable'].add(timetable)

        return timetable

    def sub_name(self):
        self._sub_name = self.f.random_element(self.subscription.keys())
        # Warning! Odd implement of an idea!
        while self._sub_name in self.unique['sub_name'] and len(self.unique['sub_name']) != len(self.subscription.keys()):
            self._sub_name = self.f.random_element(self.subscription.keys())
        self.unique['sub_name'].add(self._sub_name)
        return self._sub_name

    def sub_price(self):
        # Warning! You need to call first sub_name()!
        if self._sub_name:
            return self.subscription[self._sub_name]
        return self.f.random_element(self.subscription.values())

    def discount(self):
        return self.f.random_int(min=10, max=30, step=5)
    
    def service_name(self):
        # Warning! Here's a Crutch
        self.hall_id = self.f.random_element(fetch_many('hall'))[0]
        hall_name = fetch_by_id('hall', self.hall_id, attr='name')[0]
        service_name = self.halls_services[hall_name]
        return self.f.random_element(service_name)
        
    def service_price(self):
        return self.f.random_int(min=300, max=800, step=100)

    def service_dur(self):
        return self.f.random_int(min=60, max=90, step=30)


    def category_sport(self):
        options = (
            "высшей",
            "первой",
            "второй",
        )
        discount = {"высшей": 20, "первой": 15, "второй": 10}
        result = choice(options)
        return f"тренер {result} квалификационной категории"   


class TanyaFaker(MainFaker):
    def __init__(self):
        super().__init__()
        self.unique = {
            'category': set(),
        }
        self.date_in = ''
        self.date_out = ''
        self.category = ''
        self.property = ''
        self._category = {
            'стандарт': {
                1: ('минимальная мебель (кровать, шкаф и тумбочка); минимум принадлежностей в ванной; уборка раз в три дня; смена белья раз в неделю.', 3500),
                2: ('минимальная мебель (кровать, шкаф и тумбочка); минимум принадлежностей в ванной; уборка раз в три дня; смена белья раз в неделю.', 5000),
            },
            'люкс': {
                1: ('наличие телевизора и мини-бара; наличие нескольких комбинированных источников освещения (потолочное, настольное, прикроватное); наличие кровати размером не менее 90 на 200 см; наличие халата, тапочек, полотенец, фена, умывальных принадлежностей; уборка каждый день.', 10500),
                2: ('наличие телевизора и мини-бара; наличие нескольких комбинированных источников освещения (потолочное, настольное, прикроватное); наличие кровати размером не менеe 160 на 200; наличие халата, тапочек, полотенец, фена, умывальных принадлежностей; уборка каждый день.', 15000),
            },
            'президентский люкс': {
                1: ('наличие мини-бара, сейфа, телевизора, кондиционера, капсульной кофемашины; двуспальная кровать не менее 200 на 220; наличие халата, тапочек, полотенец, фена, люксовых умывальных принадлежностей; теплый пол в ванной комнате, джакузи, сауна; гипоаллергенные постельные принадлежности; уборка 2 раза в день и бесплатно при вызове; рабочий стол; парковочное место в подземном паркинге бесплатно.', 45000),
                2: ('наличие мини-бара, сейфа, телевизора, кондиционера, капсульной кофемашины; двуспальная кровать не менее 200 на 220; наличие халата, тапочек, полотенец, фена, люксовых умывальных принадлежностей; теплый пол в ванной комнате, джакузи, сауна; гипоаллергенные постельные принадлежности; уборка 2 раза в день и бесплатно при вызове; рабочий стол; парковочное место в подземном паркинге бесплатно.', 70000),
            },
        }
    
    def category_classif(self): 
        self.category = self.f.random_element(self._category.keys())
        self.property = self.f.random_int(min=1, max=2)
        while (self.category, self.property) in self.unique['category'] and len(self.unique['category']) != len(self._category)*2:
            self.category = self.f.random_element(self._category.keys())
            self.property = self.f.random_int(min=1, max=2)
        self.unique['category'].add((self.category, self.property))
        return self.category

    def category_desc(self): 
        return self._category[self.category][self.property][0]

    def category_price(self):
        return self._category[self.category][self.property][1]

    def room_date_in(self):
        self.date_in = self.f.date_between('-3M', '+6M')
        return self.date_in

    def room_date_out(self): 
        start_date = datetime(self.date_in.year, self.date_in.month, self.date_in.day)
        self.date_out = self.f.date_between(start_date+timedelta(days=1), start_date+timedelta(days=90))
        return self.date_out

    def reservation_date(self): 
        self.room_id = self.f.random_element(fetch_many('room'))[0]
        date_in = fetch_by_id('room', self.room_id, attr='date_in')[0]
        start_date = datetime(date_in.year, date_in.month, date_in.day)
        return self.f.date_between(start_date-timedelta(days=14), start_date-timedelta(days=1))

class MyFaker(MainFaker):
    
    def __init__(self):
        super().__init__()
        self.unique = {
            'ws': 0,
            'comp': 0,
            'prod': 0,
        }

    def price(self):
        return self.f.random_int(min=100, max=10**4, step=100)

    def amount(self):
        # Similar to count
        return self.f.random_int(min=1, max=20)

    def remain(self):
        return self.f.random_int(min=0, max=50)

    def ws_name(self):
        # ws1, ws2, ws3 ... wsn.
        self.unique['ws'] += 1
        return f"Цех{self.unique['ws']}" 
    
    def product_name(self):
        # prod1, prod2, prod3 ... prodn.
        self.unique['prod'] += 1
        return f"Изделие{self.unique['prod']}" 

    def product_desc(self):
        return Faker('la').text(100)

    def component_name(self):
        # comp1, comp2, comp3 ... compn.
        self.unique['comp'] += 1
        return f"Деталь{self.unique['comp']}" 

    def component_time(self):
        # Random amount of time to create a component
        return self.f.random_int(min=1, max=4)

class MarinaFaker(MainFaker):
    
    def __init__(self):
        super().__init__()
        self.unique = {
            'type': set(),
            'list': set(),
        }
        self.arrive = ''
        self.departure = ''
        self.type = ''
        self.count_places = ''
        self.length = ''
        self._type = {
            'малой': (80, 96),
            'средней': (152, 156),
            'большой': (138, 198),
        }

        self._rate = {
            'эконом': (4, 15),
            'комфорт': (16, 30),
            'бизнес': (50, 80),
        }

        self._class_type = ('международный', 'региональный', 'местный')
        self._class_classif = ('эконом', 'бизнес', 'первый')

    def plane_type(self):
        self.type = self.f.random_element(self._type.keys())
        a, b = self._type[self.type]
        self.count_places = self.f.random_int(min=b, max=b)
        while (self.type, self.count_places) in self.unique['type'] and len(self.unique['type']) != len(self._type)*2:
            self.type = self.f.random_element(self._type.keys())
            a, b = self._type[self.type]
            self.count_places = self.f.random_int(min=a, max=b)
        self.unique['type'].add((self.type, self.count_places))
        return self.type

    def plane_places(self):
        return self.count_places
    
    def list_departure(self):
        self.departure = self.f.city()
        return self.departure

    def list_arrive(self):
        self.arrive = self.f.city()
        while self.arrive == self.departure:
            self.arrive = self.f.city()
        return self.arrive

    def list_length(self):
        self.length = self.f.random_int(min=200, max=8000, step=500)
        return self.length
    
    def list_fuel(self):
        return self.length * 15 // 100

    def trip_code(self):
        C1 = self.f.random_uppercase_letter()
        C2 = self.f.random_uppercase_letter()
        D1 = self.f.random_digit()
        D2 = self.f.random_digit()
        D3 = self.f.random_digit()
        D4 = self.f.random_digit()
        return f'{C1}{C2}{D1}{D2}{D3}{D4}'

#    def trip_time(self):
#        self.date = self.f.date_between('-3M', '+6M')
#        self.date1 = datetime(self.date.year, self.date.month, self.date.day) + timedelta(hours=self.f.random_int(min=1, max=23), minutes=self.f.random_int(min=0, max=60, step=10)) 
#        date2 = self.date1 + timedelta(hours=self.f.random_int(min=3, max=36), minutes=self.f.random_int(min=0, max=60, step=10))
#        return self.date1.strftime('%H.%M - %d/%m/%Y'), date2.strftime('%H.%M - %d/%m/%Y')
    def trip_time(self):
        return timedelta(hours=self.f.random_int(min=1, max=36), minutes=self.f.random_int(min=0, max=60, step=10))
    
    def trip_name(self):
        result = fetch_many('list')
        self.list_id = self.f.random_element(result)[0]
        departure = fetch_by_id('list', self.list_id, attr='departure')[0].split()[1]
        arrive = fetch_by_id('list', self.list_id, attr='arrive')[0].split()[1]
        while self.list_id in self.unique['list'] and len(self.unique['list']) != len(result):
            self.list_id = self.f.random_element(result)[0]
            departure = fetch_by_id('list', self.list_id, attr='departure')[0].split()[1]
            arrive = fetch_by_id('list', self.list_id, attr='arrive')[0].split()[1]
        self.unique['list'].add(self.list_id)
        return f'{departure}—{arrive}'

    def price_rate(self): 
        self.rate = self.f.random_element(elements=self._rate.keys())
        return self.rate

    def price_price(self): 
        a, b = self._rate[self.rate]
        return self.f.random_int(min=a*1000, max=b*1000, step=500)

    def passenger_place(self):
        #self.room_id = self.f.random_element(fetch_many('room'))[0]
        #date_in = fetch_by_id('room', self.room_id, attr='date_in')[0]
        # Need fetch plane places from db
        return self.f.random_uppercase_letter() + str(self.f.random_int(min=1, max=150))
        
    def class_type(self): 
        type_ = self.f.random_element(elements=self._class_type)
        return f'для {type_} протяженности'
    
    def class_classif(self): 
        return self.f.random_element(elements=self._class_classif)

    def class_summary(self): 
        # loremipsum 
        pass

    def flight_departure(self):
        self.date = self.f.date_between('-3M', '+6M')
        self.date1 = datetime(self.date.year, self.date.month, self.date.day) + timedelta(hours=self.f.random_int(min=1, max=23),minutes=self.f.random_int(min=0, max=50, step=10))
        return self.date1.strftime('%Y-%m-%d %H:%M')

    def flight_arrive(self):
        self.trip_id = self.f.random_element(fetch_many('trip'))[0]
        delta = fetch_by_id('trip', self.trip_id, attr='time')[0]
        self.date2 = self.date1 + delta
        return self.date2.strftime('%Y-%m-%d %H:%M')
    
    def crew_level(self):
        return self.f.random_int(min=1, max=3)

def main():
    f = MarinaFaker()
    print(f._get_methods().keys())
    for i in range(20):
        #print(f.type_plane(), f.cnt_plane())
        #print(f.list_departure(), f.list_arrive(), f.list_length(), f.list_fuel())
        #print(f.trip_code())
        print(f.trip_name())


if __name__ == '__main__':
    #insert(30)
    main()
