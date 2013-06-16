class Search < ActiveRecord::Base
  attr_accessible :word,:kind

  def self.add(word, kind)
    word = word.strip
    self.delete_all(['word = ?',word])
    self.create(:word=>word,:kind=>kind)
  end
end
