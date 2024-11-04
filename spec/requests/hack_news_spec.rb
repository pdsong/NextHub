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
#  type       :integer          default(0), not null
#
require 'rails_helper'

RSpec.describe "HackNews", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
