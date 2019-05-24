module Services
  class DeckCreator
    attr_reader :external_id

    def initialize(external_id:)
      @external_id = external_id
    end

    def call
      Deck.create!(external_id: external_id)
    end
  end
end
