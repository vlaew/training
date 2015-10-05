module BuyingProcess
  module Manager
    class << self
      def buy(customer:, product:)
        errors = check_requirements(customer, product)
        return handle_fail(customer, errors) if errors.any?

        customer_data = retrieve_customer_data
        return handle_fail(customer, customer_data.errors) if customer_data.errors.any?

        errors = customer_data_errors(customer_data)
        return handle_fail(customer, errors) if errors.any?

        admin_data = retrieve_admin_data
        return handle_fail(customer, customer_data.errors) if customer_data.errors.any?

        handle_success(customer, customer_data, admin_data)
      end

      private

      def handle_success(customer, customer_data, admin_data)
        notify_customer_success(customer, customer_data)
        notify_admins_success(admin_data)
        BuyingProcess::BuyingResult.new(success: true, errors: [])
      end

      def handle_fail(customer, errors)
        notify_admins_fail(customer.email, errors)
        BuyingProcess::BuyingResult.new(success: false, errors: errors)
      end

      def notify_customer_success(customer, customer_data)
        GuestPurchaseMailer.purchase_email(customer, customer_data).deliver_later
      end

      def notify_admins_success(admin_data)
        Admin.find_each do |admin|
          AdminPurchaseMailer.operation_success(admin, admin_data).deliver_later
        end
      end

      def notify_admins_fail(customer_email, errors)
        Admin.find_each do |admin|
          AdminPurchaseMailer.operation_fail(admin, customer_email, errors).deliver_later
        end
      end

      def check_requirements(customer, product)
        errors = []
        errors << 'Users with email in *.com domain can not purchase products' if !BuyingProcess::Requirements.user_allowed_to_buy?(customer)
        errors << 'Users cannot buy this product' if !BuyingProcess::Requirements.product_can_be_bought?(product)
        errors
      end

      def retrieve_customer_data
        begin
          BuyingProcess::RetrievedData.new(data: BuyingProcess::CustomerData.new.retrieve)
        rescue Exception
          BuyingProcess::RetrievedData.new(errors: ['Customer data API timed out'])
        end
      end

      def retrieve_admin_data
        begin
          BuyingProcess::RetrievedData.new(data: BuyingProcess::AdminData.new.retrieve)
        rescue Exception
          BuyingProcess::RetrievedData.new(errors: ['Admin data API timed out'])
        end
      end

      def customer_data_errors(customer_data)
        errors             = []
        image_url_code     = image_color_from_url(customer_data.fetch('url'))
        thumbnail_url_code = image_color_from_url(customer_data.fetch('thumbnailUrl'))
        errors << 'Wrong image color during purchase process' if thumbnail_url_code > image_url_code
        errors
      end

      def image_color_from_url(url)
        pattern = /.+\/(?<color>.+)/
        r       = url.match(pattern)
        r[:color].to_i(16) if r
      end
    end
  end
end
