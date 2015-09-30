module BuyingProcess
  class AdminData
    DATA_URL = 'http://jsonplaceholder.typicode.com'

    def retrieve
      {
        id: get_todo_id
      }
    end

    private

    def get_todo_id
      response = connection.post('/todos')
      response = JSON.parse response.body
      response.fetch('id')
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
