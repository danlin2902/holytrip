class AttachmentsController < ApplicationController
  before_action :set_attachment
  before_action :set_task

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.task = @task
    @attachment.save
    # "insert Error Handling Notice" if fail to save
  end

  def update
    @attachment.update ? @attachment.save : "insert Error Handling Notice"
  end

  def destroy
    @attachment.destroy
    # insert alert for succesful delete
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_attachment
    params.require(:attachment).permit(:name, :description, :attachment_url, :task_id)
    @attachment = Attachment.find(params[:id])
end
