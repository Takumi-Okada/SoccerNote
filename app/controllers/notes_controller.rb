class NotesController < ApplicationController
  skip_before_action :logedin
  skip_before_action :leader_required,only: [:new,:show,:edit,:create,:update]


  def index
    member_id=current_user.team.members.select(:id)
    @q=Note.where(member_id: member_id).ransack(params[:q])
    @notes= @q.result(distinct: true).page(params[:page])
  end

  def new
    @note=Note.new
  end

  def show
    @note=Note.find(params[:id])
  end

  def edit
    @note=Note.find(params[:id])
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
    @note=Note.find(params[:id])
    if @note.update(note_params)
      redirect_to root_path,notice: 'ノートを更新しました'
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:title,:play_date,:contents,:good,:bad,:goal,:comment)
  end
end
