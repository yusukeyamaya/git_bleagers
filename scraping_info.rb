require 'mechanize'

agent = Mechanize.new
page = agent.get("https://grouses.jp/roster/players/")
elements = page.search('.detail p')
elements.each do |ele|
  puts ele.inner_text # inner_textメソッドでテキストを取得
end