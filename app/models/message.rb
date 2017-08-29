class Message < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :comments

  validates :content, presence: true, length: 10..160

  def format_time(zone="America/Chicago")
  	Time.use_zone(zone) { self.created_at.strftime("%b %e, %Y %l:%I %p")}
  end
end
