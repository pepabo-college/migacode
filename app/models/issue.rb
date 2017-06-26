class Issue < ApplicationRecord
  validates :title, :content, :author, presence: true
  validates :mail_address, presence: true,  :if :notificate_to_author?
  validates :notification_flg, inclusion:{in: [true, false]}

  def notificate_to_author?
    notification_flg == true
  end
end
