module BuyingProcess
  class BuyingResult
    attr_reader :errors, :success

    def initialize(success:, errors:)
      @success = success
      @errors  = errors
    end

    def success?
      success
    end
  end
end
