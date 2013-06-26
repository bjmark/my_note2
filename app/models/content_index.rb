class ContentIndex < ActiveRecord::Base
  belongs_to :note
  attr_accessible :word, :note_id

  def self.del_note(note)
    delete_all("note_id = #{note.id}")
  end

  def self.add_note(note_id,content)
    words = filter_out_word(content)
    rec = []
    words.each do |e|
      rec << {:word=>e,:note_id=>note_id}
    end
    create!(rec)
  end

  def self.update_note(note_id,content)
    words = filter_out_word(content)
    del_ids = []
    
    where(:note_id=>note_id).each do |e|
      n = words.size
      words.delete_if{|b| b == e.word}
      if n == words.size
        del_ids << e.id
      end
    end

    delete_all(:id=>del_ids)

    rec = []
    words.each do |e|
      rec << {:word=>e,:note_id=>note_id}
    end
    create!(rec)
  end

  def self.filter_out_word(str)
    str2 = str.downcase
    words = []
    x = ''
    str2.each_char do |c|
      case c
      when 'a'..'z'
        x << c
        next
      end
      
      words << x if !x.blank? && !words.include?(x)
      x = ''
    end
    words << x if !x.blank? && !words.include?(x)

    return words
  end
end
