class Usuario < ApplicationRecord
  def self.authenticate(login, pass)
    find(:first, :conditions=>["login = ? AND password = ?", login, pass]) # login, password are your users table fields…
  end

  validates :name,
            presence: true
  validates :nick,
            presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
end
