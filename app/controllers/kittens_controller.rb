class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kittnes }
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)
 
    if @kitten.save
      redirect_to root_path, notice: "You successfully created a new  kitten!"
    else
      flash.now[:error] = "No! No! No! Bad kitty!"
      render :new
    end 
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "You successfully updated your kitten!"
    else
      flash.now[:error] = "No! No! No! Bad kitty!"
      render :edit
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    redirect_to root_path, alert: "Your kitten is gone now. Sad day :-("
  end

  private
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
