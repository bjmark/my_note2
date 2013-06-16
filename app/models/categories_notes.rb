class CategoriesNotes < ActiveRecord::Base
  belongs_to :category
  belongs_to :note
  attr_accessible :note_id, :category_id
end
