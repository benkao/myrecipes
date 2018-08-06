class Message < ApplicationRecord
  belongs_to :chef
  validates :content, presence: true
  validates :chef_id, presence: true
  
  def self.most_recent
    order(:created_at).last(20) #order by created_at and show last 20 messages
  end

end