class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    
  end

  def upload
    puts "In the upload function"
    @bfile = current_user.bfiles.create(bfile_params)
    redirect_to root_path
  end


  private 
    def bfile_params
      params.require(:bfile).permit(:datafile)
    end
end
