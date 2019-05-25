# -*- coding: utf-8 -*-  
import sqlite3
import os
import yaml
import json

sql_path = os.path.join("..//sql/Generate.sql")

with open(sql_path, mode = "r") as f:
    sql_code = f.read()

# 如果 data.db 存在, 问用户是否继续生成数据库?
# if os.path.exists("data.db"):


conn = sqlite3.connect('data.db')
cusor = conn.cursor()
cusor.execute(sql_code)
conn.commit()


asset = json.load(".//asset/asset.json")
# 把asset里的信息转存到 database 里


conn.close()
