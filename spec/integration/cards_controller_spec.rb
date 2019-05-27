# frozen_string_literal: true

RSpec.describe CardsController, type: :controller do
  describe 'GET #index' do
    let(:expected_response) do
      [{ 'code' => 'AH',
         'image' => 'https://deckofcardsapi.com/static/img/AH.png',
         'images' =>
          { 'png' => 'https://deckofcardsapi.com/static/img/AH.png',
            'svg' => 'https://deckofcardsapi.com/static/img/AH.svg' },
         'suit' => 'HEARTS',
         'value' => 'ACE' },
       { 'code' => '2S',
         'image' => 'https://deckofcardsapi.com/static/img/2S.png',
         'images' =>
         { 'png' => 'https://deckofcardsapi.com/static/img/2S.png',
           'svg' => 'https://deckofcardsapi.com/static/img/2S.svg' },
         'suit' => 'SPADES',
         'value' => '2' },
       { 'code' => '4D',
         'image' => 'https://deckofcardsapi.com/static/img/4D.png',
         'images' =>
         { 'png' => 'https://deckofcardsapi.com/static/img/4D.png',
           'svg' => 'https://deckofcardsapi.com/static/img/4D.svg' },
         'suit' => 'DIAMONDS',
         'value' => '4' },
       { 'code' => '0D',
         'image' => 'https://deckofcardsapi.com/static/img/0D.png',
         'images' =>
         { 'png' => 'https://deckofcardsapi.com/static/img/0D.png',
           'svg' => 'https://deckofcardsapi.com/static/img/0D.svg' },
         'suit' => 'DIAMONDS',
         'value' => '10' },
       { 'code' => '7D',
         'image' => 'https://deckofcardsapi.com/static/img/7D.png',
         'images' =>
         { 'png' => 'https://deckofcardsapi.com/static/img/7D.png',
           'svg' => 'https://deckofcardsapi.com/static/img/7D.svg' },
         'suit' => 'DIAMONDS',
         'value' => '7' }]
    end

    it 'gets the deck and the hand of 5 cards afterwards' do
      VCR.use_cassette('deck') do
        expect do
          get :index
        end.to change { Deck.count }.by(1)
        .and change { Hand.count }.by(1)
        .and change { Card.count }.by(5)

        expect(response).to be_ok

        expected_names = [
          'ace of hearts',
          '2 of spades',
          '4 of diamonds',
          '10 of diamonds',
          '7 of diamonds'
        ]

        Card.all.each_with_index do |card, i|
          expect(card.name).to eq expected_names[i]
        end
      end
    end
  end
end
