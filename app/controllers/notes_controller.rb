class NotesController < ApplicationController
  def index
    @notes=Note.all
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
    params.require(:note).permit(:title,:play_date,:contents,:good,:bad,:goal)
  end
end
