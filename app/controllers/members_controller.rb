class MembersController < ApplicationController
  def index
    @members=Member.all
  end

  def new
    @member=Member.new
  end

  def show
    @member=Member.find(params[:id])
    @notes=@member.notes
  end

  def edit
    @member=Member.find(params[:id])
  end

  def create
    @member=Member.new(member_params)
    if @member.save
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
