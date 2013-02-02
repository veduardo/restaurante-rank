# encoding: utf-8

require 'spec_helper'

describe Qualificacao do
  it "deveria ter uma nota" do
    subject.should have_at_least(1).error_on(:nota)

    subject.nota = 10
    subject.should have(:no).errors_on(:nota)
  end

  it "deveria ter um valor gasto" do
    subject.should have_at_least(1).errors_on(:valor_gasto)

    subject.valor_gasto = 9999
    subject.should have(:no).errors_on(:valor_gasto)
  end

  it "deveria ter um cliente_id" do
    subject.should have_at_least(1).errors_on(:cliente_id)

    subject.cliente_id = 2
    subject.should have(:no).errors_on(:cliente_id)
  end

  it "deveria ter um restaurante_id" do
    subject.should have_at_least(1).errors_on(:restaurante_id)

    subject.restaurante_id = 3
    subject.should have(:no).errors_on(:restaurante_id)
  end
  
end