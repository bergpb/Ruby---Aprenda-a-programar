  # coding: utf-8
  # classe dvd herda atributos e métodos de mídia
  class DVD < Midia

    include FormatadorMoeda

    attr_reader :titulo

    # estou passando os simbolos :valor_com_desconto e :valor para
    # para dentro do método formata_moeda.
    formata_moeda :valor_com_desconto, :valor

    def initialize(titulo, valor, categoria)
      # super com () chama o inicialize sem passar argumentos.
      # definindo superclasse assim o método valor com desconto tem acesso a var @valor.
      super()
      @titulo = titulo
      @valor = valor
      @categoria = categoria
    end

  end