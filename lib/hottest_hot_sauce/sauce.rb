class HottestHotSauce::HottestHot
  attr_accessor :name, :description
  @@all = []

  def initialize(name, description)
    @name = name
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

end
