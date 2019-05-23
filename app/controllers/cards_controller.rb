require 'uri'
require 'net/http'

class CardsController < ApplicationController
  def index
    deck_id = Services::DeckShuffler.new.call
    @deck = Services::HandDrawer.new(deck_id: deck_id).call
  end
end
