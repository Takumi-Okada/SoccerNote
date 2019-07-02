class MembersController < ApplicationController
  skip_before_action :logedin,only: [:index,:show,:edit,:update]
  skip_before_action :login_required,only: [:new,:create]
  skip_before_action :leader_required,only: [:show,:edit,:new,:create,:update]
  before_action :member_require,only: [:show]
  before_action :member_edit_require,only: [:edit,:update]

  def index
    @team=current_user.team
    @members=@team.members.page(params[:page]).per(10)
  end

  def new
    @team=Team.find_by(url: params[:team_url])
    @member=@team.members.new
  end

  def show
    @notes=@member.notes.order(play_date: :desc).page(params[:page]).per(10)
    @age=age(@member.birthday)
  end

  def edit
    
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

  #自分ではないかつ指導者でもない場合はroot_pathへリダイレクト
  #他のチームの場合はroot_pathへリダイレクト
  def member_require
    @member=Member.find(params[:id])
    redirect_to root_path unless @member.id==current_user.id||current_user.leader?
    redirect_to root_path unless current_user.team.id==@member.team.id
  end

  #自分以外の編集、更新をしようとした場合はroot_pathへリダイレクト
  def member_edit_require
    @member=Member.find(params[:id])
    redirect_to root_path unless current_user.id==@member.id
  end

end
