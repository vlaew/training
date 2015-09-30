module BuyingProcess
  class Requester
    def initialize(base_url)
      @connection = Faraday.new(url: base_url) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

    def get(path:, params: {}, timeout: 3, tries: 0)
      execute_with_timeout(timeout, tries) do
        sleep(Random.new.rand(0..6))
        connection.get(path, params)
      end
    end

    def post(path:, params: {}, timeout: 3, tries: 0)
      execute_with_timeout(timeout, tries) do
        sleep(Random.new.rand(0..6))
        connection.post(path, params)
      end
    end

    private

    def execute_with_timeout(timeout, retries, &block)
      tries ||= retries
      Timeout::timeout(timeout) { block.call }
    rescue Timeout::TimeoutError
      retry if (tries -= 1) > 0
    end

    attr_accessor :connection, :timeout, :retries
  end
end
