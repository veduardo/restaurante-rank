class Receita < ActiveRecord::Base
  attr_accessible :prato_id, :conteudo

  validates :conteudo,
        :presence => { :message => "Deve ser preenchido" }

  belongs_to :prato

  validates_presence_of :prato_id
  validates_associated :prato
end
