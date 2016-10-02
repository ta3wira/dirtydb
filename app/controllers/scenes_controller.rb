class ScenesController < ApplicationController

  def index
    @s=Scene.all
  end

  def show
    @s = Scene.find_by(id: params[:id])
    @scripts = {}
    Script.by_dimensions(params[:id]).each do |v|
      @scripts[v['dimension_id']] = {} unless @scripts.has_key?(v['dimension_id'])
      @scripts[v['dimension_id']][v['sequence']] = v
    end
    # render json: @scripts
  end
end
