class UserHackNewsController < ApplicationController
  before_action :authenticate_user!

  def create
    # user_hack_news = UserHackNews.new(user_hack_news_params)
    user_hack_news = UserHackNews.find_by(user_id: current_user.id, hack_news_id: user_hack_news_params[:hack_news_id])

    if user_hack_news
      # 如果已存在，执行删除操作
      user_hack_news.destroy
      render json: { message: '取消收藏成功' }, status: :ok
    else
      user_hack_news = UserHackNews.new(user_id: current_user.id, hack_news_id: user_hack_news_params[:hack_news_id])
      if user_hack_news.save
        render json: { message: '收藏成功', user_hack_news: user_hack_news }, status: :created
      else
        render json: { errors: user_hack_news.errors.full_messages }, status: :unprocessable_entity
      end
    end

  end

  
  private

  def user_hack_news_params
    params.require(:user_hack_news).permit(:user_id, :hack_news_id)
  end


end
