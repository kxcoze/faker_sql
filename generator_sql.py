from random import choice
from pprint import pprint

from filler import MyFaker, SatieFaker, TanyaFaker, MarinaFaker
from db import execute, fetch_many, reload


def generate_insert_query(faker):
    table_name = input("Input table name: ")
    print("Input count of native columns and fk columns")
    count_column, count_fk_column = map(int, input().split())
    
    native_columns = []
    type_columns = []
    # Must fetch data from db and randomize choice
    foreign_columns = []
    values = []
    f = faker()
    available_types = f._get_methods()
    print('Available types:', ', '.join(available_types.keys()))
    print(f'Input type and name of column.\nFor example: "name name",\n"dob date_of_birth", etc.')
    for i in range(count_column):
        type_column, user_column = input(f"{i+1}: ").split()
        column_name = f"{table_name.lower()}_{user_column.lower()}"
        native_columns.append(column_name)
        type_columns.append(type_column)

    foreign_id_columns = []
    # A crutch
    special_ind = None
    for i in range(count_fk_column):
        foreign_table = input("Input name of table that your column are references to: ")
        if foreign_table == 'hall' or foreign_table == 'room' or foreign_table == 'trip_time': 
            if foreign_table == 'trip_time':
                foreign_table = 'trip'
            special_foreign_table = foreign_table
            special_ind = i
        foreign_columns.append(f"{foreign_table}_id")
        foreign_id_columns.append([f"'{x[0]}'" for x in fetch_many(foreign_table)])
    
    queries = []
    count_queries = int(input("Input count of queries: "))
    input('----------------')
    for _ in range(count_queries):
        values = [f"'{available_types[x]()}'" for x in type_columns]
        fk_values = []
        for ind, x in enumerate(foreign_id_columns):
            # A damn crutch!
            if special_ind == ind:
                if special_foreign_table == 'hall':
                    fk_values.append(str(f.hall_id))
                elif special_foreign_table == 'room':
                    fk_values.append(str(f.room_id))
                elif special_foreign_table == 'trip':
                    fk_values.append(str(f.trip_id))
            else:
                fk_values.append(choice(x))
        

        query = f"INSERT INTO {table_name.capitalize()} ({', '.join(native_columns+foreign_columns)}) VALUES({', '.join(values+fk_values)})"
        print(query)
        if execute(query):
            queries.append(query)
    return queries
 

def main():
    reload(filename='marina_schema.sql')
    with open('marina_queries.sql', 'w') as file:
        for _ in range(int(input('How many tables to insert you want: '))):
            #execute(generate_insert_query())
            for query in generate_insert_query(MarinaFaker):
                file.write(query+'\n')


if __name__ == '__main__':
    main() 
