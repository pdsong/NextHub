# == Schema Information
#
# Table name: hack_news
#
#  id         :bigint           not null, primary key
#  en_title   :string
#  cn_title   :string
#  link       :string
#  in_time    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class HackNews < ApplicationRecord

  has_many :user_hack_news
  has_many :users, through: :user_hack_news
end
