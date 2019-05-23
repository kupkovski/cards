# frozen_string_literal: true

require 'spec_helper'

describe Services::DeckShuffler do
  describe '#call' do
    let(:start) { double(:start) }
    let(:request) { double(:request) }

    context 'when response is ok' do
      it 'raises error' do
        expect(Net::HTTP)
        .to receive(:start)
        .with("deckofcardsapi.com", 443, { use_ssl: true })
        .and_yield start

        expect(start)
        .to receive(:request)
        .with(Net::HTTP::Get)
        .and_return request

        expect(request)
        .to receive(:body)
        .and_return 'error happened'

        expect do
          described_class.new.call
        end.to raise_error(RuntimeError)
        .with_message 'Error: RSpec::Mocks::Double - "error happened"'
      end
    end

    context 'when request is OK' do
      let(:request) { double(:request) }

      let(:response) do
       double(:response, body: { 'deck_id': 999 }.to_json)
     end

      it 'returns the content' do
        expect(Net::HTTP)
        .to receive(:start)
        .with("deckofcardsapi.com", 443, { use_ssl: true })
        .and_yield start

        expect(Net::HTTP::Get)
          .to receive(:new)
          .and_return request

        expect(response)
          .to receive(:is_a?)
          .with(Net::HTTPOK)
          .and_return true

        expect(start)
        .to receive(:request)
        .with(request)
        .and_return response

        expect(described_class.new.call).to eq 999
      end
    end
  end
end