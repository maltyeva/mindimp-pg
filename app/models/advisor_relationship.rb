class AdvisorRelationship < ActiveRecord::Base

	belongs_to :advisor, class_name: "User"
	belongs_to :advisee, class_name: "User"

	validates :advisor_id, presence: true
  	validates :advisee_id, presence: true
end
