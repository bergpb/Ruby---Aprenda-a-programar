# coding: utf-8

# classe dvd herda atributos e métodos de mídia
class DVD < Midia
  def initialize(titulo, valor, categoria)
    # super com () chama o inicialize sem passar argumentos.
    super() # superclasse assim o método valor com desconto tem acesso a var @valor.
    @titulo = titulo
    @valor = valor
    @categoria = categoria
  end

  def to_s
    %Q{ Título: #{@titulo}, Valor: #{@valor} }
  end

end