module BuyingProcess
  class Manager
    def buy(user:, product:)
      errors        = check_requirements(user, product)
      customer_data = retrieve_customer_data
      errors        += customer_data_errors(customer_data)
      if errors.empty?
        GuestPurchaseMailer.purchase_email(user, customer_data).deliver
        notify_admins_success
        BuyingResult.new(success: true, errors: [])
      else
        notify_admins_fail(user.email)
        BuyingResult.new(success: false, errors: errors)
      end
    end

    private

    def notify_admins_success
      Admin.all.each do |admin|
        AdminPurchaseMailer.operation_success(admin, retrieve_admin_data).deliver
      end
    end

    def notify_admins_fail(user_email)
      Admin.all.each do |admin|
        AdminPurchaseMailer.operation_fail(admin, user_email).deliver
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
