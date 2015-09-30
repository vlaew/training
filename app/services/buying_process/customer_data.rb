module BuyingProcess
  class CustomerData
    DATA_URL = 'http://jsonplaceholder.typicode.com'

    def retrieve
      get_data
    end

    private

    def get_data
      photo_id = Random.new.rand(1..5000)
      response = connection.get('/photos', id: photo_id)
      response = JSON.parse response.body
      response.first
    end

    def connection
      @connection ||= Faraday.new(url: DATA_URL) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
