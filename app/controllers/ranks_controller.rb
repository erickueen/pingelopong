class RanksController < ApplicationController
  def new
    @rank = Rank.new
  end

  def update
    @rank = Rank.find(params[:id])
    if @rank.update_attributes(rank_params)
    else
      render 'edit'
    end
  end

  def index
    @ranks = Rank.all.order('score DESC')
  end

  def create
    @rank = Rank.new(rank_params)

    if @rank.save
      redirect_to ranks_path, notice: 'Rank was successfully created.'
    else
      render :new
    end
  end
  private

    def rank_params
      params.require(:rank).permit(:score, :user_id)
    end
end
