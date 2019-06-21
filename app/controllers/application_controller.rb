class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required

    private

    #ログインしているユーザーを取得
    def current_user
        @current_user ||= Member.find_by(id: session[:member_id]) if session[:member_id]
    end

    #ログインされているかを確認
    def login_required
        redirect_to login_path unless current_user.present?
    end
end
