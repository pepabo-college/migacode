class NotificationMailer < ApplicationMailer
  default from: 'notification@migacode.herokuapp.com'

  def notificate_to_author(issue)
    @issue = issue
    mail(to: @issue.mail_address, subject: 'あなたの投稿に返信がありました。')
  end
end
