class Prato < ActiveRecord::Base
  attr_accessible :nome

  validates :nome,
      :presence => { :message => 'Deve ser preenchido' },
      :uniqueness => { :message => 'Nome ja cadastrado' }

  has_one :receita
  has_and_belongs_to_many :restaurantes

  validate :validate_presence_of_more_than_one_restaurante

  private
  def validate_presence_of_more_than_one_restaurante
    errors.add("restaurantes",
            'deve haver ao menos um restaurante') if restaurantes.empty?
  end
end