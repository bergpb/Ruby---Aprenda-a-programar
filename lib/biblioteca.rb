# coding: utf-8
class Biblioteca

  include Enumerable

  def initialize
    @banco_de_arquivos = BancoDeArquivos.new
  end

  def adiciona(livro)
    salva livro do
      livros << livro
    end if midia.kind_of? Midia
  end

  def midias_por_categoria(categoria)
    midias.select do |midia|
      midia.categoria == categoria if midia.respond_to? :categoria
    end
  end

  def midias
    @midias ||= @banco_de_arquivos.carrega
  end

  def midia
    @livros ||= @banco_de_arquivos.carrega
  end

  # método each que possibilibiblioteca = Biblioteca.newta que os outros métodos
  # do módulo Enumerable funcionem em uma instância de Biblioteca
  def each
    midias.each { |midia| yield midia }
  end

  private

  def salva(midia)
    @banco_de_arquivos.salva midia
    yield
  end

end