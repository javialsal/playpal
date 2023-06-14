class Scrapper
  require 'open-uri'
  require 'nokogiri'

  attr_reader :students

  def initialize(file_name)
    puts "scrapping students..."
    @students = []

    doc = Nokogiri::HTML(File.open(file_name), nil, 'utf-8')

    doc.search('.clasmates-student-links strong').each do |element|
      @students << element.text.strip
    end
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

