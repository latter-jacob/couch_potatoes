class HomesController < ApplicationController
  def index
    @programs = Program.limit(15)
  end
end
