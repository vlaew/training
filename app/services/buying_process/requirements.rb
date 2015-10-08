module BuyingProcess
  module Requirements
    class << self
      def product_can_be_bought?(product)
        !product.pro? && product.user.present?
      end

      def user_allowed_to_buy?(user)
        email_not_in_com_domain?(user.email)
      end

      private

      def email_not_in_com_domain?(email)
        test = email =~ /.+\.com\z/
        test.nil?
      end
    end
  end
end
