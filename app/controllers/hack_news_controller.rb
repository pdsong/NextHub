class HackNewsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:list_now]
  # def list_now
  #   hack_new_list = HackNews.order(in_time: :desc).limit(100)
  #   render json: hack_new_list
  # end
  def list_now
    hack_new_list = HackNews.order(in_time: :desc).limit(100)
    if current_user
      # 获取 hack_new_list 中的所有新闻 ID
      hack_news_ids = hack_new_list.pluck(:id)

      # 查询用户收藏的新闻 ID
      user_collected_ids = UserHackNews.where(user_id: current_user.id, hack_news_id: hack_news_ids).pluck(:hack_news_id)

      # 在 hack_new_list 中添加 isCollect 属性
      hack_new_list = hack_new_list.map do |news|
        {
          id: news.id,
          en_title: news.en_title,
          cn_title: news.cn_title,
          link: news.link,
          isCollect: user_collected_ids.include?(news.id) # 判断是否收藏
        }
      end

      render json: hack_new_list
    else
      # 如果没有有效的 token，则返回默认结果
      render json: hack_new_list
    end
  end
end
