# frozen_string_literal: true

class Hand < ApplicationRecord
  belongs_to :deck
  has_many :cards
end
