require 'open-uri'
require 'pry'
require 'nokogiri'
require 'colorize'
require_relative '../hottest_hot_sauce.rb'

class HottestHotSauce::Scraper

def self.scrape_sauces
  sauces = []
  doc = Nokogiri::HTML(open("https://www.southernliving.com/seasonings/best-tasting-hot-sauce-brands"))
  list_sauce = doc.css("h2")
  list_sauce.each do |sauce|
    new_sauce = self.new
    new_sauce.name = sauce.css("h2").text.strip
    new_sauce.description = sauce.css("p").children[0].text.strip
    sauces = new_sauce
  end
  sauces
end
