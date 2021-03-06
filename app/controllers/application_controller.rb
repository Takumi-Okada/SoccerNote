class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required
    before_action :logedin
    before_action :leader_required
    include MembersHelper

    private

    #ログインしているユーザーを取得
    def current_user
        @current_user ||= Member.find_by(id: session[:member_id]) if session[:member_id]
    end

    #未ログインの状態はログイン画面にリダイレクト
    def login_required
        redirect_to login_path unless current_user.present?
    end

    #ログイン済みの場合はroot_pathへリダイレクト
    def logedin
        redirect_to root_path if current_user.present?
    end

    #指導者フラグがFALSEの場合、詳細ページへ繊維
    def leader_required
        redirect_to current_user unless current_user.leader?
    end
end
