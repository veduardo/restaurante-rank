#encoding: utf-8

class Qualificacao < ActiveRecord::Base
  
  attr_accessible :cliente_id, :restaurante_id, :nota, :valor_gasto
  
  validates_presence_of :valor_gasto, message: ' - deve ser preenchido'
  validates_numericality_of :valor_gasto,  greater_than: 0,
                                           message: ' - deve ser um número maior que 0'

  validates_presence_of :nota, message: 'Deve ser preenchido.'
  validates_numericality_of :nota,  greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 10,
                                    message: ' - deve ser um numero entre 0 e 10'

  validates_presence_of :cliente_id, :restaurante_id
  validates_associated :cliente, :restaurante # garante o relacionamento (?)

  belongs_to :cliente
  belongs_to :restaurante

end
