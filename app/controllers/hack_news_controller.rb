class HackNewsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:list_now]
  def list_now
    hack_new_list=HackNews.order(in_time: :desc).limit(100)
    render json: hack_new_list
  end
end
