# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  answer     :string(255)
#  max_misses :integer
#  misses     :integer
#  guessed    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  # ^ knows to look at "games" table for data
  #   and defines methods from schema
  belongs_to :user

  # Answer cannot be nil or ""
  validates_presence_of :answer, :max_misses, :misses
  validate :guessed_string_is_not_nil

  def board
    result = ""
    self.answer.split("").each do |char|
      if self.guessed.include?(char)
        result += char
      else
        result += "_"
      end
    end
    result
  end

  def guess(letter)
    letter.downcase!
    found = self.answer.include?(letter)

    unless self.guessed.include?(letter)
      self.guessed += letter
      self.misses += 1 unless found
    end
    self.save!

    found
  end

  def guessed_string_is_not_nil
    if guessed.nil?
      self.errors.add :guessed, "Guessed cannot be nil"
    end
  end
end
