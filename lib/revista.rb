# coding: utf-8
require 'active_file'

class Revista
  include ActiveFile

  field :titulo
  field :valor
end