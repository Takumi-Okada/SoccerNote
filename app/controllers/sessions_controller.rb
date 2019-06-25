class SessionsController < ApplicationController
  skip_before_action :login_required
  skip_before_action :leader_required
  skip_before_action :logedin,only: [:destroy]
  def new
  end

  def create
    member=Member.find_by(email: session_params[:email])

    if member&.authenticate(session_params[:password])
      session[:member_id]=member.id
      redirect_to root_path,notice: 'ログインしました'
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが違います'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path,notice: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session).permit(:email,:password)
  end
end
