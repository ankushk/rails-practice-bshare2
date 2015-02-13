class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    
  end

  def upload
    if bfile_params && !bfile_params[:datafile].blank?
      @bfile = current_user.bfiles.create(bfile_params)
    end
    redirect_to root_path
  end

  def download
    bfile = current_user.bfiles.find(params[:bfile])
    if bfile
      file = Bfile.find(params[:bfile])
      send_file(file.datafile.path, type: 'application/octet-stream', filename: file.datafile.original_filename, x_sendfile: true)
    else
      redirect_to root_path
    end
  end

  def deletefile
    bfile = current_user.bfiles.find(params[:bfile])
    if bfile
      file = Bfile.find(params[:bfile])
      file.destroy
    end
    redirect_to root_path
  end


  private 
    def bfile_params
      if params.has_key?(:bfile) && params[:bfile].has_key?(:datafile)
        params.require(:bfile).permit(:datafile)
      else
        flash.now[:error] = "Invalid action"
        nil
      end
    end
end
