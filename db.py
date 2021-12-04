import psycopg2 as ps


conn = ps.connect('dbname=satie user=kxcoze')

cur = conn.cursor()


def reload(filename='satie_db.sql'): 
    with open(filename, 'r', encoding='utf-8') as f:
        cur.execute(f.read())
    conn.commit()


def execute(scripts): 
    for script in scripts:
        cur.execute(script)
    conn.commit()
    

def fetch_id(table): 
    cur.execute(f'SELECT {table}_id FROM {table};')
    respond = cur.fetchall()
    return respond
    

def main():
    #reload()
    print(fetch_id('trainer'))

if __name__ == '__main__':
    main() 
