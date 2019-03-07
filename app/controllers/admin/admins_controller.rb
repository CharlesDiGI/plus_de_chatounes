class Admin::AdminsController < ApplicationController
	before_action :is_admin?
    
  
end
