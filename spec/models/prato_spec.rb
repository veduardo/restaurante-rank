#encoding utf-8

require 'spec_helper'

describe Prato do
  it "deveria ter um nome" do
    subject.should have_at_least(1).error_on(:nome)

    subject.nome = 'ravioli de carne'
    subject.should have(:no).errors_on(:nome)
  end
end

