class Scrapper
  require 'open-uri'
  require 'nokogiri'

  attr_reader :students

  def initialize
    puts "scrapping students..."
    @names = []
    @bio = []
    @picture = []

    doc = Nokogiri::HTML(File.open(Rails.root.join('db', 'seeds', 'classmates_1210.html')), nil, 'utf-8')

    doc.search('.clasmates-student-links strong').each do |element|
      @names << element.text.strip
    end

    doc.search('p.student-bio-wrapper').each do |element|
      @bio << element.text
    end

    doc.search('img.img-thumbnail').each do |element|
      filepath = Rails.root.join('db', 'seeds', element.get_attribute(:src).gsub("./", "")).to_s
      @picture << filepath
    end


    @students = @names.map.with_index do |name, index|
      first_name = name.split.first
      last_name = name.split.last
      bio = @bio[index]
      pic_url = @picture[index]
      [index, { first_name:, last_name:, bio:, pic_url: }]
    end.to_h

    puts "#{@students.count} students scrapped!"
  end
end

# @students
# ["ffff", "dddd"]

# @students
# [
#   {
#     first_name: "ddd",
#     last_name: "dddd"
#   }
# ]
