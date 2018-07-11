# coding: utf-8
class Midia
  attr_accessor :valor # atribui os metodos reader and writer
  attr_reader :titulo

  def initialize
    @desconto = 0.1
    @valor = 10.0 # inicializando para que possamos testar com a classe midia
  end

  def valor_com_desconto
    @valor - (@valor * @desconto)
  end

end