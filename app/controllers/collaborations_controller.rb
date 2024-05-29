class CollaborationsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @collaboration = Collaboration.new
    @collaboration.project = @project
    @collaboration.user = current_user
    @collaboration.save

    redirect_to dashboard_path
  end
end
