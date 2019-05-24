# frozen_string_literal: true

class Deck < ApplicationRecord
  has_one :hand

  validates :external_id, presence: true
end
