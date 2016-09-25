class SkillsController < ApplicationController
  def index
    @skills=Skill.where("name like ?", "#{params['q']}%")
    respond_to do |format|
      format.json { render :json => @skills }
    end
  end
end
