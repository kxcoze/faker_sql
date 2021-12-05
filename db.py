import psycopg2 as ps


conn = ps.connect('dbname=satie user=kxcoze')

cur = conn.cursor()


def reload(filename='satie_schema.sql'): 
    with open(filename, 'r', encoding='utf-8') as f:
        cur.execute(f.read())
    conn.commit()


def execute_many(scripts): 
    for script in scripts:
        try:
            cur.execute(script)
        except ps.Error as e:
            print(f"ERROR: {e}")
            print(f"Skipped this -> {script}")
        conn.commit()
def execute(script):
    try:
        cur.execute(script)
        res = True
    except ps.Error as e:
        res = False
        print(f"ERROR: {e}")
        print(f"Skipped this -> {script}")
    finally:
        conn.commit()
    return res


def fetch_many(table, attr='id'): 
    cur.execute(f'SELECT {table}_{attr} FROM {table};')
    respond = cur.fetchall()
    return respond

def fetch_by_id(table, id, attr='id'):
    cur.execute(f'SELECT {table}_{attr} FROM {table} WHERE {table}_id = {id}')
    respond = cur.fetchone()
    return respond

def main():
    print(fetch_by_id('timetable', 1, attr='time'))
    #reload()
    #print(fetch_id('trainer'))

if __name__ == '__main__':
    main() 
