class MembersController < ApplicationController
  skip_before_action :logedin

  def index
    @members=Member.all
  end

  def new
    @team=Team.find(params[:team_id])
    @member=@team.members.new
  end

  def show
    @member=Member.find(params[:id])
    @notes=@member.notes
  end

  def edit
    @member=Member.find(params[:id])
  end

  def create
    @team=Team.find(params[:team_id])
    @member=@team.members.new(member_params)
    if @member.save
      session[:member_id]=@member.id
      redirect_to members_path,notice: '登録完了しました'
    else
      render :new
    end
  end

  def update
    @member=Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path,notice: '基本情報を更新しました'
    else
      render :edit
    end
  end

  private

  def member_params
    params.require(:member).permit(:name,:email,:password,:password_confirmation,:birthday,:position,:avatar)
  end

end
