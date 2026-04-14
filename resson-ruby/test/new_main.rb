require_relative './qiita'

qiita = Qiita.new("Python")
q  = qiita.search
p q

qiita.query = "java"
p qiita.query
p qiita.search