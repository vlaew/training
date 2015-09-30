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
      response = connection.post(path: '/todos', tries: 3, timeout: 10)
      response = JSON.parse response.body
      response.fetch('id')
    end

    def connection
      @connection ||= Requester.new(DATA_URL)
    end
  end
end
