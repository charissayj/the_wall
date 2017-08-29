class Comment < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :message, required: true

  validates :content, presence: true, length: 10..160

  def format_time(zone="America/Chicago")
  	Time.use_zone(zone) { self.created_at.strftime("%b %e, %Y %l:%M %p")}
  end
end
