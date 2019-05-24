# frozen_string_literal: true

module Services
  class DeckShuffler < Base
    def call
      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        request = Net::HTTP::Get.new(uri)
        response = http.request(request)

        validate_response(response)
        JSON.parse(response.body)['deck_id']
      end
    end

    private

    def uri
      URI('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1')
    end
  end
end
