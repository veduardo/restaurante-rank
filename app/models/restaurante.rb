#coding: utf-8

class Restaurante < ActiveRecord::Base
  attr_accessible :nome, :endereco, :especialidade

  def self.query_rapida
    self.select([:nome, :endereco, :especialidade])
  end

  # validates_presence_of :nome, :presence => true :message => 'Deve ser preenchido.'
  # validates_length_of :nome, :maximum => 80,
  #                     :message => 'A string excede o número máximo de caracteres.'
  validates :nome,  
          :presence => { :message => 'Deve ser preenchido.' },
          :length => { :maximum => 80, :message => 'muito grande' } #, :message => 'A string excede o número máximo de caracteres.' }
  
  # validates :nome,
  #       :uniqueness => { :scope => :estado } # ou :uniqueness => true

  validates_presence_of :endereco, :message => 'Deve ser preenchido.'

  validates :especialidade, :presence => {:message => 'Deve ser preenchido.'},
                            :length => { :maximum => 40,
                      :message => 'A string excede o número máximo de caracteres.'}

  validate :primeira_letra_deve_ser_maiuscula

  private
  def primeira_letra_deve_ser_maiuscula
    errors.add(:nome, 'primeira letra deve ser maiuscula!') unless nome =~ /\A[A-Z].*\z/
                                                                      # \A : primeiro caractere da strin
                                                                      # \z : último caractere da string
  end

  has_many :qualificacoes, :dependent => :destroy   #apaga as entradas das qualificações do restaurante em questão.
  has_and_belongs_to_many :pratos

  has_many :comentarios, as: :comentavel

  # Outros tipos de validação:
  # validates :sexo,
  #       :includsion => { :in => %w{m, f}}

  # validates :telefone,
  #       :format => {
  #             :with => REGEX
  #           }

  # validates :senha,
  #       :length => { in => 6..10,
  #             :too_short => 'Muito curto',
  #             :too_long => 'Muito longo'}

  # validates :idade,
  #       :numericality => {
  #         :only_integer => true
  #       }

  # Validações especiais
  # validates :termos_de_uso,
  #     :acceptance => true

  # validates :senha,
  #     :confirmation => true

end
