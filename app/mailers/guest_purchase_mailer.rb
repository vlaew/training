class GuestPurchaseMailer < ActionMailer::Base
  SUBJECT = 'Product purchase'

  def purchase_email(guest, customer_data)
    @image_url = customer_data.fetch('url')
    mail(
      from:     'dima@belka-studio.ru',
      to:       mail_to(guest),
      subject:  subject
    )
  end

  private

  def mail_to(guest)
    guest.email
  end

  def subject
    SUBJECT
  end
end
