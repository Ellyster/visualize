require_relative 'Engine.rb'
require_relative 'ProtovisEngine.rb'
require_relative 'VegaEngine.rb'

class Plot
  def initialize (engineName, chartName, title, data, labels, size = [500,500], color = ['#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00'])
    @engine = Object.const_get(sanitizeEngine(engineName)).new(chartName, title, data, labels, size, color)
  end

  def save_svg(fileName)
    @engine.save_svg(fileName)
  end

  def sanitizeEngine (engineName)
    return "#{engineName}Engine"
  end

end
