module Services
  class CardsCreator
    attr_reader :hand_id, :data

    def initialize(hand_id:, data:)
      @hand_id = hand_id
      @data = data
    end

    def call
      data.map do |card_data|
        Card.create!(
          hand_id: hand_id,
          name: "#{card_data['value'].to_s.downcase} of #{card_data['suit'].to_s.downcase}",
          image: card_data['image']
        )
      end
    end
  end
end