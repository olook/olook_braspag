class CallbacksController < ApplicationController
  
  def new
  end

  def create
    render :text => "<status>OK</status>"
  end

end