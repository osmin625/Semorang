# !!!!!!!!!!!!중요!!!!!!!!!!! 이 파일은 한번만 돌리고 안돌려도 됨
# 이미 things_50.csv가 존재한다면 안돌려야 함

# 새로 만들려면 원래 잇던 thing_50.csv 파일 없애고 다시 컴파일
#('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude', 'sido', 'sigoongoo', 'bubjungdong')

import pandas as pd

p = "Semorang/insert_auto/상가정보_sample/"
csv_test = pd.read_csv(p + "소상공인시장진흥공단_상가(상권)정보_대구_202206.csv")
csv_test = csv_test[csv_test['상권업종대분류명'] == '음식']
csv_test = csv_test.sample(50)
csv_test = csv_test.loc[:, ['상가업소번호', '상호명', '상권업종소분류코드', '경도', '위도', '시도명', '시군구명', '법정동명']]
print(csv_test)

csv_test.to_csv("Semorang/insert_auto/thing_50.csv")