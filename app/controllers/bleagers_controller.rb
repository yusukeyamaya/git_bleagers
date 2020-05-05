class BleagersController < ApplicationController
  
  def index
    @bleagers = Bleager.order("team_name ASC")
  end
  
  def show
    @bleagers = Bleager.find(params[:id])
    
  end
  
  def search
    @bleagers = Bleager.where('name_ja LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end
end
