class ArticleSource < ActiveRecord::Base

	validates_presence_of :title

	has_many :articles

	has_attached_file :photo 



end
