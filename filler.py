from random import choice

from faker import Faker


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
        self.timetable = (
            'Пн-Пт, 6:00-21:00, Сб-Вс, 8:00-23:00',
            'Пн-Пт, 7:00-21:00, Сб-Вс, 8:00-22:00',
            'Ежедневно, 7:00-23:00',
            'Ежедневно, 8:00-22:00',
            'Ежедневно, 9:00-22:00',
            'Ежедневно, 9:00-21:00',
        )

        self.halls_services = {
            'Бассейн': (
                'Бассейн',
            ),
            'Тренажерный зал': (
                'Тренажерный зал',
            ),
            'Фитнес зал' : (
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

    def time(self):
        return self.f.random_element(elements=self.timetable)

    def category_sport(self):
        options = (
            "высшей",
            "первой",
            "второй",
        )
        discount = {"высшей": 20, "первой": 15, "второй": 10}
        result = choice(options)
        return f"тренер {result} квалификационной категории"   

class MyFaker(MainFaker):
    
    def __init__(self):
        super().__init__()

    def price(self):
        return self.f.random_int(min=100, max=10**4, step=100)


def main():
    f = MyFaker()
    print(f._get_methods().keys())
#    for i in range(10):
#        print(f.name(), f.gender())
#        print(f.gender(), f.name())


if __name__ == '__main__':
    #insert(30)
    main()
