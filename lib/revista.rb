# coding: utf-8
require 'fileutils'

class Revista
  attr_reader :titulo, :id
  attr_accessor :valor # permite escrita no atributo valor

  def initialize(titulo, valor)
    @titulo = titulo
    @valor = valor
    @id = self.class.next_id # Atribui um id ao objeto Revista
    @destroyed = false
    @new_record = true
  end

  def save
    File.open("db/revistas/#{@id}.yml", "w") do |file|
      file.puts serialize
    end
  end

  #criamos o método find como método do objeto Class referente a classe Revista . Isso faz bastante sentido
  #já que não termos a instância do objeto que estamos procurando, nós na verdade
  #queremos criá-la a partir do conteúdo do arquivo

  def self.find(id)
    #kernel module, executado apenas se o método File.exists? retorna false
    raise DocumentNotFound,
          "Arquivo db/revistas/#{id} não encontrado.", caller
    unless File.exists?("db/revistas/#{id}.yml")
      YAML.load File.open("db/revistas/#{id}.yml", "r")
    end
  end

  def destroy
    unless @destroyed or @new_record
      @destroyed = true
      FileUtils.rm "db/revistas/#{@id}.yml"
    end
  end

  private
  def serialize
    YAML.dump self
  end

  def self.next_id
    # gera o próximo id para o objeto que está sendo criado
    Dir.glob("db/revistas/*.yml").size + 1
  end

end