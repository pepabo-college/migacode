class RepliesController < ApplicationController

  def create
    @reply = Reply.create(content: reply_params[:content], author: reply_params[:author], issue_id: reply_params[:issue_id])
    redirect_to issue_path(@reply.issue.id)
  end

  private
  def reply_params
    params.permit(:content, :author, :issue_id)
  end

end
