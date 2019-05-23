module Services
  class HandDrawer < Base
    attr_reader :deck_id

    def initialize(deck_id:)
      @deck_id = deck_id
    end

    def call
      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        request = Net::HTTP::Get.new(uri)
        response = http.request(request)

        validate_response(response)
        JSON.parse(response.body)
      end
    end

    private

    def uri
      URI("https://deckofcardsapi.com/api/deck/#{deck_id}/draw/?count=5")
    end
  end
end