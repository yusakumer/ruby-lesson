require_relative './qiita'

qiita = Qiita.new("Python")
q  = qiita.search
p q

qiita.query = "Ruby"
p qiita.query
p qiita.search