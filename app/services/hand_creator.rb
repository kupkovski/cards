module Services
  class HandCreator
    attr_reader :data, :deck_id

    def initialize(data:, deck_id:)
      @data = data
      @deck_id = deck_id
    end

    def call
      hand = Hand.create!(deck_id: deck_id)
      CardsCreator.new(hand_id: hand.id, data: data['cards']).call
    end
  end
end
