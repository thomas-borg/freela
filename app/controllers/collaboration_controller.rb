class CollaborationController < ApplicationController
  def new
    @collaboration = @project.collaboration.new
  end

  def create
    @project = Project.find(params[:project_id])
    @collaboration = @project.collaboration.new
    @collaboration.project = @project
    @collaboration.user = current_user
    @collaboration.save

    redirect_to dashboard_path
  end

  private

  # def collaboration_params
  #   params.require(:collaboration).permit(:project)
  # end
end
