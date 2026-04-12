require_relative './qiita'

qiita = Qiita.new("Ruby")
q  = qiita.search
p q