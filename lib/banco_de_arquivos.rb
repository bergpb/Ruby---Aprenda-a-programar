# coding: utf-8
require 'yaml'

class BancoDeArquivos

  # serializa e salva o conteúdo do arquivo
  def salva(livro)
    File.open("livros.yml", "a") do |arquivo|
      arquivo.puts YAML.dump(livro)
      arquivo.puts ""
    end
  end

  # deserializa e carrega o conteúdo do arquivo
  def carrega
    $/ = "\n\n"
    File.open("livros.yml", "r").map do |livro_serializado|
      YAML.load livro_serializado
    end
  end

end