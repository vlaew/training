module BuyingProcess
  class RetrievedData
    attr_reader :data, :errors

    def initialize(data: nil, errors: [])
      @data   = data
      @errors = errors
    end
  end
end
