#encoding: utf-8

class Cliente < ActiveRecord::Base
  attr_accessible :nome, :idade

  validates_presence_of :nome, message: ' - deve ser preenchido'
  validates_uniqueness_of :nome, message: ' - nome já cadastrado'

  validates_numericality_of :idade, message: ' - deve ser um número inteiro entre 0 e 100',
                                    greater_than: 0,
                                    less_than: 100

  has_many :qualificacoes  
end