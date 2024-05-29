class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  before_action :set_skills, only: [:new, :create]

  def index
    @projects = Project.all
    if params[:query].present?
      # sql_subquery = <<~SQL
      #   projects.name @@ :query
      #   OR projects.skill @@ :query
      #   OR projects.description @@ :query
      # SQL
      # @projects = @projects.where(sql_subquery, query: params[:query])
      @projects = Project.global_search(params[:query])
    end
  end

  def show
    if current_user
      @collaboration = Collaboration.new
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :skill, :description, :start_date, :end_date, :user_id)
  end

  def set_skills
    @skills = ['Front-End Developer', 'Back-End Developer', 'Full Stack Developer', 'UX/UI Designer', 'Graphic Designer']
  end
end
