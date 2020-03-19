class Task < ApplicationRecord
	belongs_to :user
	enum important_status: {"選択無し":0, "重要×緊急":1, "重要×緊急ではない":2, "重要ではない×緊急":3, "重要でも緊急でもない":4}
end
