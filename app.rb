require 'roda'
require 'slim'

class App < Roda
  plugin :render, engine: 'slim'

  route do |r|
    r.root do
      render 'index'
    end
  end
end
