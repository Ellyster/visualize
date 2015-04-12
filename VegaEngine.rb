require 'plotrb'

require_relative 'Engine.rb'

class VegaEngine < Engine

  def save_svg(fileName)
    vis = self.send(@chart)
    jsonContent = vis.generate_spec(:pretty)

    # I plan to implement a native conversion on Week 10,
    # to avoid the dependence on Vega headless tools.
    # But this hack can do the trick for the prototype.
    File.write("_tmp.json", jsonContent)
    system "vg2svg -h _tmp.json #{fileName}"
    system "rm _tmp.json"
  end



  def pie_chart
    rad = @size[0] / 2.0
    new_data = []

    for i in 0..@data.size do
      new_data << {id: i, value: @data[i], label: @labels[i] }
    end

    data = pdata.name("data#{rand()}").values(new_data).transform(pie_transform.value('value'))

    scale = ordinal_scale.name("colors#{rand()}").from(data).to_colors

    mark = arc_mark.from(data) do
        enter do
            x_start { group(:width).times(0.5) }
            y_start { group(:height).times(0.5) }
            start_angle { from :start_angle }
            end_angle { from :end_angle }
            inner_radius 0
            outer_radius rad
            stroke '#fff'
            fill { scale(scale).field('id') }
        end
    end

    #mark_t = text_mark.from(data) do
    #    enter do
    #        x_start { group(:width).times(0.5) }
    #        y_start { group(:height).times(0.5) }
    #        text { field(:label) }
    #        fill '#000'
    #    end
    #end

    vis = visualization.name(@title).width(@size[0]).height(@size[1]) do
        data data
        scales scale
        marks mark
    end

    return vis
  end
end
