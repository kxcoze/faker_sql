from random import choice

from filler import MyFaker
from db import execute, fetch_id, reload


def generate_insert_query():
    table_name = input("Input table name: ")
    count_column = int(input("Input count of native columns not fk's! (if your table has autoincrement column don't specify them): "))

    print("Does your table have any fk keys?")
    is_have_fk = input("[y/n]: ").lower()
    if is_have_fk == 'y':
        count_fk_column = int(input("Input count of fk column: "))
    elif is_have_fk == 'n':
        count_fk_column = 0
    else:
        raise ValueError
    
    native_columns = []
    type_columns = []
    # Must fetch data from db and randomize choice
    foreign_columns = []
    values = []
    f = MyFaker()
    available_types = f._get_methods()
    print('Available types:', ', '.join(available_types.keys()))
    print(f'Input type and name of column.\nFor example: "name name",\n"dob date_of_birth", etc.')
    for i in range(count_column):
        type_column, user_column = input(f"{i+1}: ").split()
        column_name = f"{table_name.lower()}_{user_column.lower()}"
        native_columns.append(column_name)
        type_columns.append(type_column)
    foreign_id_columns = []
    for _ in range(count_fk_column):
        foreign_table = input("Input name of table that your column are references to: ")
        foreign_columns.append(f"{foreign_table}_id")
        foreign_id_columns.append([f"'{x[0]}'" for x in fetch_id(foreign_table)])

    queries = []
    count_queries = int(input("Input count of queries: "))
    input('----------------')
    for _ in range(count_queries):
        values = [f"'{available_types[x]()}'" for x in type_columns]
        fk_values = [choice(x) for x in foreign_id_columns]
        query = f"INSERT INTO {table_name.capitalize()} ({', '.join(native_columns+foreign_columns)}) VALUES({', '.join(values+fk_values)})"
        queries.append(query)
    
    return queries
 

def main():
    for _ in range(int(input('How many tables to insert you want: '))):
#        execute(generate_insert_query())
        print(generate_insert_query())

if __name__ == '__main__':
    main() 