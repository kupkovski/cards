module Services
  class Base
    def validate_response(response)
      unless response.is_a?(Net::HTTPOK)
        raise "Error: #{response.class} - #{response.body.inspect}"
      end
    end
  end
end