class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    # @project = Project.new
  end

  def create
    # @project = Project.new(project_params)
    # @project.user_id = params[:user_id]
    # @project.save!
    # # if @project.save
    #   # redirect_to dashboard path
    # # else
    #   # render :new, status: :unprocessable_entity
    # # end
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :skills, :description, :start_date, :end_date, :user_id)
  end

end