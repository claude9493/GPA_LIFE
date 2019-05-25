import sqlite3
class query(object):
    # 对成绩进行查询与计算的类, conn 是对 data.db 的链接

    def __init__(self, conn):
        if isinstance(conn, sqlite3.Connection):
            self.conn = conn
        else:
            raise TypeError("A sqlite3 connect object is required.")
    
    def check(self):
        # TO-DO
        # 检查数据库是否有效(是否存在数据, 是否完整)
        pass

    def credit(self):
        cusor = self.conn.cusor()
        # TO-DO
        self._credit = cusor.execute("select sum(credit) as \"credit\" from curriculum;")
        cusor.close()
        return(self._credit)
    
    def over_all_GPA(self):
        cusor = self.conn.cusor()
        # TO-DO
        self._over_all_GPA = cusor.execute("select sum(credit * grade) as \"over_all_gpa\" \
            from curriculum;")
        cusor.close()
        return(self._over_all_GPA)
    
    