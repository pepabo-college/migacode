class RepliesController < ApplicationController

  def create
    @issue = Issue.find(params[:issue_id])
    @reply = Reply.create(reply_params)
    @replies = @issue.replies
    respond_to do |format|
      if @reply.save
        if @issue.notification_flg == true
          NotificationMailer.notificate_to_author(@issue).deliver_now
        end

        format.html { redirect_to @issue, notice: '返信しました' }
      else
        format.html { render "issues/show" }
      end
    end
  end

  private
  def reply_params
    params.require(:reply).permit(:content,:author).merge(issue_id: @issue.id)
  end
end
