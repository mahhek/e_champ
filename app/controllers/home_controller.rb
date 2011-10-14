class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => ["event_search","index","help"]
  before_filter :check_profile, :except => ["event_search","index","help"]

  def index
   render :layout => "home"
  end

  def help
    render :layout => "application"
  end

  def check_profile
    if current_user && current_user.profile.blank?
      flash[:notice] = "Please Create your profile first!"
      redirect_to :controller => "profiles", :action => "new"
    end
  end

  def event_search    
  end

end