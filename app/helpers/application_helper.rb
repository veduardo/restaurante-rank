module ApplicationHelper

  def menu_principal
    menu = %w(cliente qualificacao restaurante)
    menu_principal = ""
    menu.each do |item|
      menu_principal << "<li>"
      menu_principal << link_to(item.capitalize, :controller => item.pluralize)
      menu_principal << "</li>"
    end
    raw menu_principal
  end

  def valor_formatado(number)
    number_to_currency(number, :unit => "R$",
                                :separator => ',',
                                :delimiter => '.')
  end

  def comentarios(comentavel)
    comentarios = "<h3>Comentarios</h3>"
    comentarios << render(comentavel.comentarios) unless comentavel.comentarios.empty?
    raw comentarios
  end

  def novo_comentario(comentavel)
    form_novo_comentario = render partial:  "comentarios/novo_comentario",
                                  locals:   {comentavel: comentavel}
    raw  form_novo_comentario
  end

end
