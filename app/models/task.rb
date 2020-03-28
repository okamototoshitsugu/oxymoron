class Task < ApplicationRecord
	validates :title, presence: true
	belongs_to :user
	has_many :bookmarks
	has_many :sub_tasks
	def bookmark_by?(user)
		bookmarks.where(user_id: user.id).exists?
	end
	enum important_status: {"選択無し":0, "重要×緊急":1, "重要×緊急ではない":2, "重要ではない×緊急":3, "重要でも緊急でもない":4}
end
