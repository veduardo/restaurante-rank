#encoding: utf-8

module RestaurantesHelper
  def boas_vindas
    if params[:user] == '1'
      return '<h2>Oi, usuário</h2>'.html_safe
    else
      return '<h2>Quem é você?</h2>'.html_safe
    end
  end
end
