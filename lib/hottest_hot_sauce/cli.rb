#CLI Controller
require_relative '../hottest_hot_sauce.rb'
require 'pry'

class HottestHotSauce::CLI

  attr_accessor :name, :description

  def call
    puts "Thank You For Your Interest In Hot Sauce"
    list
  end

  def list
  HottestHotSauce::Scraper.scraper_category

  puts "Please type list to see the Hot Sauce Choices or type exit: "
 input = gets.strip.downcase
 if input == "list"
   HottestHotSauce::Scraper.all.each.with_index(1) do |list, index|
     puts "#{index}.#{list.title}"
   end
   display_description
 elsif input == "exit"
   goodbye
 else
   puts "Invalid"
   list
 end
end

def display_description
 puts "Please type the number you are interested in!!"
 input = gets.strip.to_i
 if input <= HottestHotSauce::Scraper.all.size && input > 0
   index = input-1
   puts "You selected #{input}.#{HottestHotSauce::Scraper.all[index].title}"
   puts "#{HottestHotSauce::Scraper.all[index].description}"
   display_again
 elsif input <= 0 || input > HottestHotSauce::Scraper.all.size
   puts "Invalid number"
   display_description
 else
   goodbye
 end
end

def display_again
 puts "Would you like to see another sauce? [y/n]"
 answer = gets.strip.downcase
 if answer == "yes" || answer == "y"
   puts "Great!"
   display_description
 elsif answer == "no" || answer == "n"
   goodbye
 else
   puts "Invalid. Please type again."
   display_again
 end
end

def goodbye
 puts "Thanks for visiting my project."
end

end
