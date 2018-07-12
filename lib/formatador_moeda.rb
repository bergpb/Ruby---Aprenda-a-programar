module FormatadorMoeda
  def metodo_de_instancia
    "um metodo de instancia qualquer"
  end

  # Módulo que guarda os métodos de classe

  module ClassMethods
    # O * indica que um ou mais parâmetros podem ser passados para o método,
    # os mesmos são coletados e repassados para dentro de uma array.

    def formata_moeda(*variaveis_e_metodos)
      variaveis_e_metodos.each do |name|
        define_method("#{name}_formatado") do
          # respond_to retorna um boolean,
          # e send envia o objeto para dentro do método formata_moeda

          valor = respond_to?(name) ? send(name) : instance_variable_get("@#{name}")
          "R$ #{valor}"
        end
      end
    end
  end

  # hook method que é executado quando incluímos o módulo
  # dentro de alguma classe, recebendo no argumento
  # classe_que_incluiu_modulo o objeto %%Class%% que
  # representa a classe que incluiu o módulo

  def self.included(classe_que_incluiu_modulo)
    classe_que_incluiu_modulo.extend(ClassMethods)
  end

end