class RestaurantesController < ApplicationController
  # layout 'premium', :only => [:new, :edit]  #:except => [:index]
  # before_filter :loga   # , :only => [:new, :show, :create]
  # after_filter :loga_de_novo
  # around_filter :around, :except => [:new]

  # respond_to :xml, :json, :html

  def index
    @restaurantes = Restaurante.order('nome').page(params['page']).per(3)
    # respond_to do |format|
    #   format.json { render :json => @restaurantes }
      # format.html { } # ação padrão
      # format.js   { head: 'ok' }
    # end
  end

  def show
    @restaurante = Restaurante.find(params[:id])
    flash[:alerta] = 'Cuidado! Flash boladao!'
    # respond_with @restaurante
  end

  def new
    @restaurante = Restaurante.new

    # Exibe layout de acordo com a condição
    # if 1 == 1
      # render :new, :layout => 'premium'
    # else
      render :new
    # end

    # respond_with @restaurante
  end

  def create
    @restaurante = Restaurante.new(params[:restaurante])
    if @restaurante.save
      redirect_to(action: 'show', id: @restaurante)
    else
      render :new
    end
  end

  def edit
    @restaurante = Restaurante.find(params[:id])
    # respond_with @restaurante
  end

  def update
    @restaurante = Restaurante.find(params[:id])
    if @restaurante.update_attributes(params[:restaurante])
      redirect_to(action: 'show', id: @restaurante) # ou redirect_to @restaurante
    else
      # render action: 'edit' # ou 
      render :edit
    end
  end

  def destroy
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy

    redirect_to(action: 'index')
  end

  def mostra
    @coisa = Restaurante.first
  end

private
  def loga
    puts "*" * 100
  end

  def loga_de_novo
    puts "DE NOVO! " * 20
  end

  def around
    logger.debug 'oi'
    yield
    logger.info 'tchau'
  end
end
