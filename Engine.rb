class Engine

  def initialize (_chartName, _title, _data, _labels, _size, _color)
    @chart = sanitizeChart(_chartName)
    @title = _title
    @data = _data
    @labels = _labels
    @size = _size
    @color = _color
  end

  def sanitizeChart(chartName)
    return "#{chartName}_chart"
  end

end
