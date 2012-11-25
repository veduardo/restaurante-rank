class Cliente < ActiveRecord::Base
  attr_accessible :nome, :idade

  scope :velhos, order(:idade).reverse_order.limit(10)
  # scope :ativo, where(:confirmado => true)
  
  validates :nome,
        :presence => { :message => 'Deve ser preenchido.' },
        :uniqueness => { :message => 'Nome ja cadastrado.' }

  # estilo de validação antiga
  validates_numericality_of :idade, greater_than: 0,
                                    less_than: 100,
                                    message: "Deve ser um numero entre 0 e 100"

  has_many :qualificacoes
end