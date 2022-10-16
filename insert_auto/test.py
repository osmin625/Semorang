import numpy
import pandas as pd

p = "Semorang/insert_auto/소상공인시장진흥공단_상가(상권)정보_20220630/"
csv_test = pd.read_csv(p + "소상공인시장진흥공단_상가(상권)정보_대구_202206.csv")
csv_test = csv_test.sample(50)
print(csv_test)

# csv_test.to_csv("Semorang/insert_auto/thing_50.csv")