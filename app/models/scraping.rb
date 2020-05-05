class Scraping
  def self.player_urls
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://www.hitachi-sunrockers.co.jp/team/players/")
    elements = current_page.search('.player a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end

    links.each do |link|
      get_bleager(link)
    end
  end

  def self.get_bleager(link)
    agent = Mechanize.new
    page = agent.get(link)
    
    player_url = page.at('.image img')[:src] if page.at('.image img')
    number = page.at('.number.en-no').inner_text if page.at('.number.en-no')
    name_ja = page.at('.name-wrap .ja').inner_text if page.at('.name-wrap .ja')
    name_en = page.at('.name-wrap .en').inner_text if page.at('.name-wrap .en')
    position = page.at('.position').inner_text if page.at('.position')
    college = page.at('.tbl-profile tr:first-child td').inner_text if page.at('.tbl-profile tr:first-child td')
    birthplace = page.at('.tbl-profile tr:nth-child(2) td').inner_text if page.at('.tbl-profile tr:nth-child(2) td')
    birthday = page.at('.tbl-profile tr:nth-child(3) td').inner_text if page.at('.tbl-profile tr:nth-child(3) td')
    cm = page.at('.tbl-profile tr:nth-child(4) td').inner_text if page.at('.tbl-profile tr:nth-child(4) td')
    kg = page.at('.tbl-profile tr:nth-child(5) td').inner_text if page.at('.tbl-profile tr:nth-child(5) td')
    nationality = page.at('.tbl-profile tr:nth-child(6) td').inner_text if page.at('.tbl-profile tr:nth-child(6) td')

    bleager = Bleager.where(name_ja: name_ja).first_or_initialize
    bleager.player_url = player_url
    bleager.number = number
    bleager.name_ja = name_ja
    bleager.name_en = name_en
    bleager.position =position
    bleager.college =college
    bleager.birthplace =birthplace
    bleager.birthday =birthday
    bleager.cm =cm
    bleager.kg =kg
    bleager.nationality =nationality
    
    
    bleager.save
  end
end