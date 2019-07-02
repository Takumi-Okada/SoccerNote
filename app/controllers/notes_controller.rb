class NotesController < ApplicationController
  skip_before_action :logedin
  skip_before_action :leader_required,only: [:new,:show,:edit,:create,:update,:destroy]
  before_action :note_member_require,only: [:show,:edit,:update,:destroy]

  def index
    member_id=current_user.team.members.select(:id)
    @q=Note.where(member_id: member_id).order(play_date: :desc).ransack(params[:q])
    @notes= @q.result(distinct: true).page(params[:page]).per(20)
  end

  def new
    @note=Note.new
  end

  def show
  end

  def edit
  end

  def create
    @note=current_user.notes.new(note_params)
    if @note.save
      redirect_to root_path,notice: 'ノートを作成しました'
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      CommentMailer.creation_email(@note.member).deliver_now if params[:comment].present?
      redirect_to root_path,notice: 'ノートを更新しました'
    else
      render :new
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path,notice: 'ノートを削除しました'
  end

  private

  def note_params
    params.require(:note).permit(:title,:play_date,:contents,:good,:bad,:goal,:comment)
  end
 
  #自分のノートではないかつ指導者でもない場合はroot_pathへリダイレクト
  #他のチームのノートの場合はroot_pathへリダイレクト
  def note_member_require
    @note=Note.find(params[:id])
    redirect_to root_path unless @note.member.id==current_user.id||current_user.leader?
    redirect_to root_path unless current_user.team.id==@note.member.team.id
  end
end
