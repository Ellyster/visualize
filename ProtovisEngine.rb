require 'rubyvis'

require_relative 'Engine.rb'

class ProtovisEngine < Engine

  def save_svg(fileName)
    vis = self.send(@chart)
    vis.render
    svgContent = vis.to_svg
    File.write(fileName, svgContent)
  end



  def pie_chart
    data = @data
    labels = @labels.reverse.dup

    w = @size[0]
    h = @size[1]

    r = w / 2.0

    a = pv.Scale.linear(0, pv.sum(data)).range(0, 2 * Math::PI)

    #/* The root panel. */
    vis = pv.Panel.new().width(w).height(h);

    #/* The wedge, with centered label. */

    vis.add(pv.Wedge)
        .data(data)
        .bottom(w / 2.0)
        .left(w / 2.0)
        .innerRadius(0)
        .outerRadius(r)
        .angle(a)
      .anchor("center").add(pv.Label)
      .visible(lambda {|d|  d > 0.80})
        .textAngle(0)
        .text(lambda {|d| "#{labels.pop}"});

    return vis
  end
end
