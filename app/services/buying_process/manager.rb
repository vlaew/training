module BuyingProcess
  class Manager
    def buy(user:, product:)
      errors = check_requirements(user, product)
      return handle_fail(user, errors) if errors.any?
      begin
        customer_data = retrieve_customer_data
      rescue Exception
        return handle_fail(user, ['Customer data API timed out'])
      end
      begin
        admin_data = retrieve_admin_data
      rescue Exception
        return handle_fail(user, ['Admin data API timed out'])
      end

      errors = customer_data_errors(customer_data)
      return handle_fail(user, errors) if errors.any?

      GuestPurchaseMailer.purchase_email(user, customer_data).deliver
      notify_admins_success(admin_data)
      BuyingResult.new(success: true, errors: [])
    end

    private

    def handle_fail(user, errors)
      notify_admins_fail(user.email, errors)
      BuyingResult.new(success: false, errors: errors)
    end

    def notify_admins_success(admin_data)
      Admin.all.each do |admin|
        AdminPurchaseMailer.operation_success(admin, admin_data).deliver
      end
    end

    def notify_admins_fail(user_email, errors)
      Admin.all.each do |admin|
        AdminPurchaseMailer.operation_fail(admin, user_email, errors).deliver
      end
    end

    def check_requirements(user, product)
      errors = []
      errors << 'Users with email in *.com domain can not purchase products' unless user_valid?(user)
      errors
    end

    def user_valid?(user)
      test = user.email =~ /.+\.com$/
      test.nil?
    end

    def retrieve_customer_data
      CustomerData.new.retrieve
    end

    def retrieve_admin_data
      AdminData.new.retrieve
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
