class UploadsController < ApplicationController

  def show
    @upload = Upload.find(params[:id])
  end

  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      render :json => { :path => "#{Rails.root}#{@upload.ufile.url}" }, :content_type => 'text/html'
    else
      #todo handle error
      render :json => { :result => 'error'}, :content_type => 'text/html'
    end
  end

  def update
    @upload = Upload.find(params[:id])
    if @upload.update_attributes(params[:upload])
      flash[:notice] = "Successfully updated."
      redirect_to root_path
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    render :nothing => true
  end

  def show_uploaded
    @upload = Upload.last
  end

  def desc_update
   @upload = Upload.find(params[:upload_id])
   @upload.update_attribute(:description, params[:description])
  end

end