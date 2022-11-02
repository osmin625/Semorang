import random
import cx_Oracle
import datetime 

cx_Oracle.init_oracle_client(lib_dir=r"C:\OracleDBproject\instantclient_21_7")  # 여기서 각자 라이브러리 위치 설정해줘야함
connection = cx_Oracle.connect(user='admin', password='Semorang1234', dsn='semodb_high')
# 본인이 접속할 오라클 클라우드 DB 사용자이름, 비밀번호, dsn을 넣어준다.
print(connection)

# 전체 thing들 가져오기
cursor = connection.cursor()
cursor.execute("select T.THING_ID from THING T")
thing_rows = cursor.fetchall()
thing_rows = 

# THINGRANK 한 줄 만들기
def random_thingrank(user_id):
        thingrank_id = thingrank_id
        user = user_id
        ranks = 1

        thingking_year = str(random.randint(2019,2020))
        thingking_month = str(random.randint(1,12))
        thingking_day = str(random.randint(1,28))
        thingking_date = thingking_year + '-' + thingking_month + '-' + thingking_day
        thingking_date = datetime.datetime.strptime(thingking_date, '%Y-%m-%d')

        update_year = str(random.randint(2021,2022))
        update_month = str(random.randint(1,12))
        update_day = str(random.randint(1,28))
        update_date = update_year + '-' + update_month + '-' + update_day
        update_date = datetime.datetime.strptime(update_date, '%Y-%m-%d')

        return ((thingrank_id, user, ranks, thingking_date, update_date))

# thing에서 thing_id를 가져와야함. 주의! user 1명은 thing 1개에 대해서 1나의 thingrank만 가진다. ranks는 1부터 순차적으로 올라감(즉, 기존에 그 유저가 몇 개 만들었는지 확인해야함)
def make_thingrank_user(n):
    # user ID 다 가져오기
    cursor = connection.cursor()
    cursor.execute("select U.USER_ID from USERS U")
    user_rows = cursor.fetchall()
    # print(len(rows))

    count = 0
    while count < n:
        # user 1명 랜덤 선택
        user = user_rows[random.randint(0,len(user_rows)-1)][0]
        cursor = connection.cursor()
        # user 1명에 대한 thing_rank 전부 가져오기        
        cursor.execute("select TR.THING_RANK_ID from USERS U ,THINGRANK TR WHERE U.USER_ID = TR.USER_ID AND U.USER_ID = :TEMP_USER_ID",TEMP_USER_ID = user)
        tr_rows = cursor.fetchall()
        
        
        # 해당 user에 대한 thingrank가 있다면 snapshot 생성
        if(len(tr_rows)>0):
            # snapshot id 1개 생성
            snapshot_id = "snapshot_" + str(count+1)
            # RS insert문 생성
            cursor.execute("INSERT INTO RANKING_SNAPSHOT VALUES (:1,:2,:3,:4,:5,:6,:7)", random_snapshot_data(snapshot_id,user))
            # S_include_TR insert문 i개 생성
            i = random.randint(1,len(tr_rows))
            for j in range(0,i):
                cursor.execute("INSERT INTO S_INCLUDE_TR VALUES (:SNAPSHOT_ID,:THING_RANK_ID)",SNAPSHOT_ID=snapshot_id,THING_RANK_ID=tr_rows[j][0])
            count +=1
        else:
            pass
