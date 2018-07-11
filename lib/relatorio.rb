# coding: utf-8
class Relatorio

  def initialize(biblioteca)
    @biblioteca = biblioteca
  end

  def total
    # O método inject recebe como primeiro argumento um valor que será atri-
    # buto a variável acumuladora, geralmente inicializado em 0, o segundo argumento
    # é um bloco que recebe outros dois argumentos, o primeiro é a variável acumula-
    # dora, que foi inicializada anteriormente, no exemplo, 0.
    @biblioteca.livros.map(&:valor).inject(:+)
  end

  def titulos
    #A expressão &:titulo cria um bloco como este: { |livro| livro.titulo }.
    #O character & invoca um método t o_proc no objeto, e passa este bloco para o método map .
    @biblioteca.livros.map &:titulo
  end

end
