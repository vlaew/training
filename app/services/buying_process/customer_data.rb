module BuyingProcess
  class CustomerData
    DATA_URL = 'http://jsonplaceholder.typicode.com'

    def retrieve
      get_data
    end

    private

    def get_data
      photo_id = Random.new.rand(1..5000)
      response = connection.get(path: '/photos', params: { id: photo_id }, timeout: 10)
      response = JSON.parse response.body
      response.first
    end

    def connection
      @connection ||= Requester.new(DATA_URL)
    end
  end
end
