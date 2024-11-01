module Api
  module V1
    class UserHackNewsController < ApplicationController
      include Pagy::Backend
      # before_action :authenticate_user!

      def index
        return render json: { message: 'no user' }, status: :unauthorized unless current_user

        # user_hack_news_scope = UserHackNews.where(user_id: current_user.id).order(created_at: :desc)
        user_hack_news_scope = UserHackNews
                               .joins(:hack_news) # 假设 UserHackNews 与 HackNews 有关联
                               .where(user_id: current_user.id)
                               .order(created_at: :desc)
                               .select('user_hack_news.*, hack_news.cn_title, hack_news.en_title, hack_news.link')
        @pagy, @user_hack_news = pagy(user_hack_news_scope, items: params[:per_page] || 10, page: params[:page] || 1)

        render json: {
          data: @user_hack_news,
          pagy: {
            count: @pagy.count,
            page: @pagy.page,
            items: @pagy.items,
            pages: @pagy.pages
          }
        }
      end

      def create
        # user_hack_news = UserHackNews.new(user_hack_news_params)
        user_hack_news = UserHackNews.find_by(user_id: current_user.id,
                                              hack_news_id: user_hack_news_params[:hack_news_id])

        if user_hack_news
          # 如果已存在，执行删除操作
          user_hack_news.destroy
          render json: { message: '取消收藏成功' }, status: :ok
        else
          user_hack_news = UserHackNews.new(user_id: current_user.id,
                                            hack_news_id: user_hack_news_params[:hack_news_id])
          if user_hack_news.save
            render json: { message: '收藏成功', user_hack_news: }, status: :created
          else
            render json: { errors: user_hack_news.errors.full_messages }, status: :unprocessable_entity
          end
        end
      end

      private

      def user_hack_news_params
        # 去掉:user_id
        params.require(:user_hack_news).permit(:hack_news_id)
      end
    end
  end
end
