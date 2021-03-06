class TeamsController < ApplicationController
  require 'securerandom'
  skip_before_action :login_required,only: [:new,:create]
  skip_before_action :logedin,only: [:show,:edit,:update]
  skip_before_action :leader_required,only: [:new,:show,:update,:create]

  def new
    @team=Team.new
  end

  def show
  end

  def edit
  end

  def create
    @team=Team.new(team_params)
    @team.url=SecureRandom.alphanumeric(30)
    if @team.save
      session[:member_id]=@team.members.first.id
      redirect_to root_path,notice: 'チームを登録しました'
    else
      render :new
    end
  end

  def update

  end

  private

  def team_params
    params.require(:team).permit(:name, members_attributes: [:name,:birthday,:email,:password,:password_confirmation,:leader])
  end
end
