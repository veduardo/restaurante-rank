module ApplicationHelper

  def menu_principal
    menu = %w(cliente qualificacao restaurante)
    menu_principal = ""
    menu.each do |item|
      menu_principal << "<p>"
      menu_principal << link_to(item.capitalize, :controller => item.pluralize)
      menu_principal << "</p>"
    end
    raw menu_principal
  end

  def valor_formatado(valor)
    number_to_currency(valor, :unit => "R$",
                              :separator => ',',
                              :delimiter => '.')
  end

  def comentarios(comentavel)
    comentarios = "<div id='comentarios'>"
    comentarios << "<h3>Comentarios</h3>"
    comentarios << render(comentavel.comentarios) unless comentavel.comentarios.empty?
    comentarios << "</div>"
    raw comentarios
  end

end

