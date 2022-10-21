# INSERT INTO RANKING_SNAPSHOT VALUES ('snapshot_1','for_match5', 'user_43','comment11','1111-11-11','2222-2-22',362,10);

# 이름            널?       유형             
# ------------- -------- -------------- 
# SNAPSHOT_ID   NOT NULL VARCHAR2(11)   
# THING_RANK_ID          VARCHAR2(11)   
# USER_ID                VARCHAR2(11)   
# CONTENT       NOT NULL VARCHAR2(3000) 
# TAKEN_DATE             DATE           
# UPDATE_DATE            DATE           
# LIKE_COUNT             NUMBER(10)     
# DISLIKE_COUNT          NUMBER(10

import random

lyric = """어쩐지 오늘 알람이 안 울려
아무거나 막 입었고 지각이야
아래로 몸을 낮추고 숨을 꾹 참아봤지만
아이쿠 들켰나 봐
내 맘이 방심할 때마다 불쑥 나타난 뒤
헤엄치듯 멀어지는 너
또 물보라를 일으켜
Da-da-da-da, da-da-da-da-da-da
Da-da-da-da 또 물보라를 일으켜
Da-da-da-da, da-da-da-da-da-da
Da-da-da-da 또 물보라를 일으켜
이 파도 위 난 온종일
서핑을 하는 느낌 아찔한 feeling
난 솔직히 푹 빠졌지
하지만 이건 secret
또 물보라를 일으켜
갑자기 웃으며 얼굴을 불쑥 다가온 뒤
원을 갈라 하트를 그려
또 물보라를 일으켜
Da-da-da-da, da-da-da-da-da-da
Da-da-da-da 또 물보라를 일으켜
Da-da-da-da, da-da-da-da-da-da
Da-da-da-da 또 물보라를 일으켜
Da-da-da-da, da-da-da-da-da-da
Da-da-da-da 또 물보라를 일으켜
Da-da, da-da-da-da-da-da
Da-da-da-da 또 물보라를 일으켜
단팥을 넣었으면 단팥빵
크림을 넣었으면 크림빵
겨울엔 따끈따끈 호빵
아침엔 똥글똥글 모닝빵
가루 가루 밀가루 반죽은
치대고 치대면 부풀어 오르고
오랜 시간 손맛은
우리를 배신하지 않는다
빵 먹고 빵빵 뱃속이 빵빵
빵 먹고 빵빵 든든해 빵빵
딸기잼도 샐러드도
발라버려 어울려
빵 먹다 뻑뻑하면 우유를 한잔
빵 먹다 너무달아 커피를 한잔
꼭꼭 씹어 먹다보면
살살 녹아버린다
빵빵빵빵 빵 빵빵
빵빵빵빵 빵 빵빵
빵빵빵빵공공칠 빵
안녕하세요
제 이름은 빵빵빵 입니다
50줄 체워야되서 쓰는데 뭘 써야될까요
50줄 체웠나 확인해볼까요?"""

n = 50

def auto_rank_snap(u, l, n):
    insert_quote = []
    rank_snap_tup = []
    for i in range(n):
        rank_snap_id = 'snapshot_'+str(i+1)
        
        thing_rank_id = 'for_match' + str(u[i][0])

        user = 'user_' + str(u[i][1])
        
        content = l[i]

        taken_year = str(random.randint(1000,9999))
        taken_month = str(random.randint(1,12))
        taken_day = str(random.randint(1,30))
        taken_date = taken_year + '-' + taken_month + '-' + taken_day
        
        update_year = str(random.randint(1000,9999))
        update_month = str(random.randint(1,12))
        update_day = str(random.randint(1,30))
        update_date = update_year + '-' + update_month + '-' + update_day

        like = random.randint(0,10**10)
        dislike = random.randint(0,10**10)
        
        rank_snap_tup.append([rank_snap_id, thing_rank_id, user, content, taken_date, update_date, like, dislike]) 
    
    for ad in rank_snap_tup:
        insert_quote.append('INSERT INTO RANKING_SNAPSHOT\nVALUES ' + str(tuple(ad)) + ';') 

    return insert_quote

usr = []
while len(usr) != n:    
    a = random.randint(1,n)       
    b = random.randint(1,n)       
    while (a in usr) and (b in usr) and (a == b):
        a = random.randint(1,n)
        b = random.randint(1,n)       
    usr.append([a, b])



lyric = lyric.split('\n')
lyric = lyric[:50]

ans = auto_rank_snap(usr,lyric, n)
for a in ans:
    print(a)


"""
INSERT INTO rank_snap VALUES ('snapshot_1', 'for_match34', 'user_1', '어쩐지 오늘 알람이 안 울려', '6424-10-21', '1103-6-30', 806325299, 4950963914);
INSERT INTO rank_snap VALUES ('snapshot_2', 'for_match3', 'user_38', '아무거나 막 입었고 지각이야', '8586-11-14', '3699-10-27', 6486617258, 9628439824);
INSERT INTO rank_snap VALUES ('snapshot_3', 'for_match19', 'user_33', '아래로 몸을 낮추고 숨을 꾹 참아봤지만', 
'2878-8-29', '7142-8-4', 5124206750, 339667250);
INSERT INTO rank_snap VALUES ('snapshot_4', 'for_match49', 'user_44', '아이쿠 들켰나 봐', '5409-2-2', '2172-12-2', 2383724011, 5910551552);
INSERT INTO rank_snap VALUES ('snapshot_5', 'for_match46', 'user_10', '내 맘이 방심할 때마다 불쑥 나타난 뒤', '8159-5-3', '9343-4-30', 7128738965, 5974446402);
INSERT INTO rank_snap VALUES ('snapshot_6', 'for_match40', 'user_6', '헤엄치듯 멀어지는 너', '2604-8-13', '8832-4-30', 8927488640, 316725568);
INSERT INTO rank_snap VALUES ('snapshot_7', 'for_match11', 'user_31', '또 물보라를 일으켜', '1260-4-18', '4250-11-30', 237967375, 4217524157);
INSERT INTO rank_snap VALUES ('snapshot_8', 'for_match36', 'user_14', 'Da-da-da-da, da-da-da-da-da-da', '9978-11-11', '6282-1-20', 8113804827, 4228079470);
INSERT INTO rank_snap VALUES ('snapshot_9', 'for_match35', 'user_28', 'Da-da-da-da 또 물보라를 일으켜', '4507-5-15', '9444-1-29', 8481635263, 9500991666);
INSERT INTO rank_snap VALUES ('snapshot_10', 'for_match6', 'user_1', 'Da-da-da-da, da-da-da-da-da-da', '5814-8-18', '6529-5-6', 2629438814, 1303698371);
INSERT INTO rank_snap VALUES ('snapshot_11', 'for_match49', 'user_50', 'Da-da-da-da 또 물보라를 일으켜', '7880-11-5', '1332-10-20', 2603179900, 3998966232);
INSERT INTO rank_snap VALUES ('snapshot_12', 'for_match20', 'user_7', '이 파도 위 난 온종일', '9236-6-11', '1235-11-29', 1148029165, 4544102521);
INSERT INTO rank_snap VALUES ('snapshot_13', 'for_match16', 'user_5', '서핑을 하는 느낌 아찔한 feeling', '1760-11-27', '9432-9-18', 4758598797, 6299679796);
INSERT INTO rank_snap VALUES ('snapshot_14', 'for_match38', 'user_3', '난 솔직히 푹 빠졌지', '2948-3-15', '4198-5-4', 7077609044, 5123540715);
INSERT INTO rank_snap VALUES ('snapshot_15', 'for_match38', 'user_38', '하지만 이건 secret', '3696-9-6', '6253-12-19', 8083628472, 4191397432);
INSERT INTO rank_snap VALUES ('snapshot_16', 'for_match1', 'user_37', '또 물보라를 일으켜', '9711-2-3', '3425-12-4', 2816701001, 510973750);
INSERT INTO rank_snap VALUES ('snapshot_17', 'for_match16', 'user_1', '갑자기 웃으며 얼굴을 불쑥 다가온 뒤', '3243-7-27', '4228-11-7', 4124575649, 2816467695);
INSERT INTO rank_snap VALUES ('snapshot_18', 'for_match35', 'user_11', '원을 갈라 하트를 그려', '4492-9-24', '6931-9-22', 6928759016, 5242758220);
INSERT INTO rank_snap VALUES ('snapshot_19', 'for_match45', 'user_32', '또 물보라를 일으켜', '1100-12-7', '4852-4-2', 9989944750, 1317471602);
INSERT INTO rank_snap VALUES ('snapshot_20', 'for_match41', 'user_37', 'Da-da-da-da, da-da-da-da-da-da', '5337-9-23', '8401-4-28', 9072148246, 45169462);
INSERT INTO rank_snap VALUES ('snapshot_21', 'for_match48', 'user_22', 'Da-da-da-da 또 물보라를 일으켜', '1089-12-9', '7238-4-14', 6026057387, 5830734684);
INSERT INTO rank_snap VALUES ('snapshot_22', 'for_match20', 'user_30', 'Da-da-da-da, da-da-da-da-da-da', '2725-6-5', '6447-6-27', 5960998763, 2394297737);
INSERT INTO rank_snap VALUES ('snapshot_23', 'for_match10', 'user_4', 'Da-da-da-da 또 물보라를 일으켜', '9905-2-4', '7839-1-24', 9267832215, 2518231506);
INSERT INTO rank_snap VALUES ('snapshot_24', 'for_match32', 'user_30', 'Da-da-da-da, da-da-da-da-da-da', '7374-12-23', '3367-1-12', 7041749659, 466224279);
INSERT INTO rank_snap VALUES ('snapshot_25', 'for_match3', 'user_16', 'Da-da-da-da 또 물보라를 일으켜', '6861-1-24', '1918-9-5', 8420510695, 3453565781);
INSERT INTO rank_snap VALUES ('snapshot_26', 'for_match23', 'user_25', 'Da-da, da-da-da-da-da-da', '9829-3-19', '9432-12-19', 7188253052, 4180523214);
INSERT INTO rank_snap VALUES ('snapshot_27', 'for_match46', 'user_19', 'Da-da-da-da 또 물보라를 일으켜', '9624-11-16', '8335-4-2', 6609756819, 8498891084);
INSERT INTO rank_snap VALUES ('snapshot_28', 'for_match19', 'user_15', '단팥을 넣었으면 단팥빵', '1111-4-2', '8859-3-21', 3256031426, 4920687650);
INSERT INTO rank_snap VALUES ('snapshot_29', 'for_match32', 'user_1', '크림을 넣었으면 크림빵', '8964-3-28', '1722-9-7', 3638605500, 2520059534);
INSERT INTO rank_snap VALUES ('snapshot_30', 'for_match44', 'user_20', '겨울엔 따끈따끈 호빵', '1518-5-17', '1716-2-17', 5942005806, 9133951889);
INSERT INTO rank_snap VALUES ('snapshot_31', 'for_match30', 'user_47', '아침엔 똥글똥글 모닝빵', '4771-7-6', '8741-10-28', 5117625369, 8256365412);
INSERT INTO rank_snap VALUES ('snapshot_32', 'for_match12', 'user_21', '가루 가루 밀가루 반죽은', '6711-7-4', '2436-2-6', 6902512648, 8091512141);
INSERT INTO rank_snap VALUES ('snapshot_33', 'for_match17', 'user_43', '치대고 치대면 부풀어 오르고', '2844-4-5', '7138-1-30', 5831504989, 7159235937);
INSERT INTO rank_snap VALUES ('snapshot_34', 'for_match39', 'user_21', '오랜 시간 손맛은', '1909-1-22', '9970-4-19', 9540519759, 7984848746);
INSERT INTO rank_snap VALUES ('snapshot_35', 'for_match42', 'user_4', '우리를 배신하지 않는다', '4985-6-12', '8002-9-18', 4142089330, 4279003262);
INSERT INTO rank_snap VALUES ('snapshot_36', 'for_match12', 'user_40', '빵 먹고 빵빵 뱃속이 빵빵', '6224-1-18', '1196-5-4', 2927523432, 5472173577);
INSERT INTO rank_snap VALUES ('snapshot_37', 'for_match49', 'user_30', '빵 먹고 빵빵 든든해 빵빵', '2401-2-30', '5870-1-10', 6434743753, 5110609399);
INSERT INTO rank_snap VALUES ('snapshot_38', 'for_match26', 'user_15', '딸기잼도 샐러드도', '1112-1-25', '9133-8-19', 7331000672, 4930117564);
INSERT INTO rank_snap VALUES ('snapshot_39', 'for_match8', 'user_45', '발라버려 어울려', '4121-9-1', '9712-5-12', 1187791422, 9843808472);
INSERT INTO rank_snap VALUES ('snapshot_40', 'for_match31', 'user_8', '빵 먹다 뻑뻑하면 우유를 한잔', '4751-8-25', '5546-2-21', 6282659208, 4851416531);
INSERT INTO rank_snap VALUES ('snapshot_41', 'for_match14', 'user_31', '빵 먹다 너무달아 커피를 한잔', '6259-9-3', '1143-8-21', 89734636, 9439385616);
INSERT INTO rank_snap VALUES ('snapshot_42', 'for_match1', 'user_47', '꼭꼭 씹어 먹다보면', '5141-8-7', '7654-1-19', 6092431351, 4037822688);
INSERT INTO rank_snap VALUES ('snapshot_43', 'for_match49', 'user_20', '살살 녹아버린다', '1265-3-20', '4395-9-15', 149749397, 8514794968);
INSERT INTO rank_snap VALUES ('snapshot_44', 'for_match48', 'user_25', '빵빵빵빵 빵 빵빵', '2233-2-22', '2557-7-28', 9008672488, 2668448120);
INSERT INTO rank_snap VALUES ('snapshot_45', 'for_match17', 'user_40', '빵빵빵빵 빵 빵빵', '9167-4-3', '9606-8-19', 1659054697, 2808615134);
INSERT INTO rank_snap VALUES ('snapshot_46', 'for_match42', 'user_37', '빵빵빵빵공공칠 빵', '2003-4-13', '9063-4-12', 1315448590, 2604295130);
INSERT INTO rank_snap VALUES ('snapshot_47', 'for_match10', 'user_36', '안녕하세요', '8373-6-19', '4257-1-16', 
2333918622, 3342994762);
INSERT INTO rank_snap VALUES ('snapshot_48', 'for_match45', 'user_12', '제 이름은 빵빵빵 입니다', '5157-8-28', 
'9679-1-6', 1387376474, 407175104);
INSERT INTO rank_snap VALUES ('snapshot_49', 'for_match38', 'user_15', '50줄 체워야되서 쓰는데 뭘 써야될까요', 
'8756-8-4', '2147-1-22', 8816617154, 2060432340);
INSERT INTO rank_snap VALUES ('snapshot_50', 'for_match10', 'user_29', '50줄 체웠나 확인해볼까요?', '8804-2-11', '6816-11-21', 8566298121, 9294863585);
"""