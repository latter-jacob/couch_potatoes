class HomesController < ApplicationController
  def index
    @programs = Program.all
  end
end
