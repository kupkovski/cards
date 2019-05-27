# frozen_string_literal: true

class CardsController < ApplicationController
  def index
    deck_external_id = Services::DeckShuffler.new.call
    deck = Services::DeckCreator.new(external_id: deck_external_id).call

    hand_data = Services::HandDrawer.new(deck_id: deck_external_id).call
    @cards = Services::HandCreator.new(deck_id: deck.id, data: hand_data).call
  end
end
