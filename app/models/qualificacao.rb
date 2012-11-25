class Qualificacao < ActiveRecord::Base
  attr_accessible :nota, :valor_gasto, :cliente_id, :restaurante_id

  validates :nota,
        :presence => { :message => 'Deve ser preenchido' }

  validates :valor_gasto,
        :presence => { :message => 'Deve ser preenchido' }

  validates_numericality_of :nota, greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 10,
                                    message: 'Deve ser um numero entre 0 e 10'

  validates_numericality_of :valor_gasto, greater_than: 0,
                                          message: 'Deve ser um numero maior que 0'

  belongs_to :cliente
  belongs_to :restaurante

  validates_presence_of :cliente_id, :restaurante_id
  validates_associated :cliente, :restaurante

  has_many :comentarios, as: :comentavel
end
