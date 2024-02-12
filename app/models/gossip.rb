class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_tag_with_gossips
  has_many :tags, through: :join_tag_with_gossips
end
