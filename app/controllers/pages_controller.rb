class PagesController < ApplicationController
	 include HighVoltage::StaticPage


	 before_filter :require_admin, :only => :admin_portal


	 def admin_portal
	 end

	 
end
