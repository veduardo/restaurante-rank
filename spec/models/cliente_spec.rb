#encoding utf-8

require 'spec_helper'

describe Cliente do
  it "deveria ter um nome" do
    subject.should have_at_least(1).error_on(:nome)

    subject.nome = 'Vinny'
    subject.should have(:no).errors_on(:nome)
  end

  it "deveria ter uma idade" do
    subject.should have_at_least(1).error_on(:idade)

    subject.idade = 27
    subject.should have(:no).errors_on(:idade)
  end

end