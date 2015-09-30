module BuyingProcess
  class Manager
    def buy(user:, product:)
      errors = check_requirements(user, product)

      if errors.empty?
        BuyingResult.new(success: true, errors: [])
      else
        BuyingResult.new(success: false, errors: errors)
      end
    end

    private

    def check_requirements(user, product)
      errors = []
      errors << 'Users with email in *.com domain can not purchase products' unless user_valid?(user)
      errors
    end

    def user_valid?(user)
      test = user.email =~ /.+\.com$/
      test.nil?
    end
  end
end
