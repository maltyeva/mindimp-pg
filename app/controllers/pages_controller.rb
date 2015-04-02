class PagesController < HighVoltage::PagesController


	 before_filter :require_admin

	 def admin_portal
	 	@active_course_periods = CoursePeriod.where("active = ?", true)
	 end


end
