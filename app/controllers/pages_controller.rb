class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[homepage]

  def homepage; end

  def dashboard; end
end
