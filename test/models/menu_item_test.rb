# == Schema Information
#
# Table name: menu_items
#
#  id         :bigint(8)        not null, primary key
#  label      :string
#  slug       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  container  :integer
#

require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
