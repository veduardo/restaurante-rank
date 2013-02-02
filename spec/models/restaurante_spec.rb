#encoding: utf-8

require 'spec_helper'

describe Restaurante do
  it 'deveria ter um nome' do
    subject.should have_at_least(1).error_on(:nome)

    subject.nome = 'Fasano'
    subject.should have(:no).errors_on(:nome)
  end

  it 'deveria ter um endereco' do
    subject.should have_at_least(1).errors_on(:endereco)

    subject.endereco = 'Av. Paulista'
    subject.should have(:no).errors_on(:endereco)
  end

  it 'deveria ter uma especialidade' do
    subject.should have_at_least(1).errors_on(:especialidade)

    subject.especialidade = 'Av. Paulista'
    subject.should have(:no).errors_on(:especialidade)
  end
end