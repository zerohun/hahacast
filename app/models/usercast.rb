class Usercast < ActiveRecord::Base
  belongs_to :user
  has_many :mentions

  require "#{Rails.root}/lib/tree_sort.rb"
  def tree_sorted_mentions
    sorted_mentions = []
    self.mentions.roots.each do |root_mention|
      sorted_mentions += TreeSort.sort_by_depth_first(root_mention)
    end
    sorted_mentions
  end
end
