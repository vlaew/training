class Admin < User
  def admin?
    true
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
