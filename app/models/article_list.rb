class ArticleList < ActiveRecord::Base


	belongs_to :user, class_name: "User", foreign_key: "watcher_id"
	belongs_to :article

	validates :watcher_id, presence: true
  	validates :article, presence: true
end
