#coding:utf-8
class HelpsController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    @help = Help.find_by_name(params[:id].strip)

    @title = "#{@help.title}-"
    respond_to do |format|
      format.html
      format.xml  { render :xml => @help }
    end
  end

end
