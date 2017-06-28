class Issue < ApplicationRecord
  validates :title, :content, :author, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :mail_address, presence: true, format: { with: VALID_EMAIL_REGEX }, if: :notificate_to_author?
  validates :notification_flg, inclusion:{in: [true, false]}

  def notificate_to_author?
    notification_flg == true
  end
end
