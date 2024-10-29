# == Schema Information
#
# Table name: user_hack_news
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  hack_news_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_user_hack_news_on_hack_news_id              (hack_news_id)
#  index_user_hack_news_on_user_id                   (user_id)
#  index_user_hack_news_on_user_id_and_hack_news_id  (user_id,hack_news_id) UNIQUE
#
require 'rails_helper'

RSpec.describe UserHackNews, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
