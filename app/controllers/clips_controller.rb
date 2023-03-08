class ClipsController < ApplicationController
  def index
    @clip_new = Clip.new
    @clips = Clip.all
  end
  
  def create
    
  end
end
