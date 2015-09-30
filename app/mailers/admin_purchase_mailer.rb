class AdminPurchaseMailer < ActionMailer::Base
  SUBJECT = 'Product purchase'

  def operation_success(admin, admin_data)
    @purchase_id = admin_data.fetch(:id)
    mail(
      from:     'dima@belka-studio.ru',
      to:       mail_to(admin),
      subject:  subject
    )
  end

  def operation_fail(admin, guest_email, errors = [])
    @guest_email = guest_email
    @errors = errors
    mail(
      from:     'dima@belka-studio.ru',
      to:       mail_to(admin),
      subject:  subject
    )
  end

  private

  def mail_to(admin)
    admin.email
  end

  def subject
    SUBJECT
  end
end
