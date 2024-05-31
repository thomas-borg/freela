class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @projects = Project.order(created_at: :desc).limit(3)
  end

  def dashboard
    if user_signed_in?
      @user = current_user
      # @user = User.find(141) # test
      @projects = Project.where(user: @user)

      @received_collaborations = Collaboration.joins(:project)
                                         .where(projects: { user: @user }, accepted: false)

      @collaborations = Collaboration.where(user: @user, accepted: true)
    else
      redirect_to new_user_session_path, alert: "Vous devez être connecté pour accéder à cette page."
    end
  end
end
