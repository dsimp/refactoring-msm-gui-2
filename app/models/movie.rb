# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  validates(:director_id, presence: true)
  validates(:title, uniqueness: true)

  has_many(:characters, class_name: "Character", foreign_key: "character_id")

  def characters 
    my_id = self.id

    matching_characters = Character.where({ :movie_id => my_id})
    return matching_characters
  end

  belongs_to(:director)
  
end
