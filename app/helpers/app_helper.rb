module AppHelper
  def render_notice(message, type: :notice)
    cl = 'alert-info'


    if type == :error
      cl = 'alert-danger'
    end



    "<div class='alert #{cl}' role='alert'>#{message}</div>".html_safe
  end

  def svg(name, color)
    doc = File.open("#{Rails.root}/app/assets/images/icons/#{name}") { |f| Nokogiri::XML(f) }

    svg = doc.root
    svg["width"] = "40px"
    svg["height"] = "40px"
    svg["style"] = "fill: #{color}"

    svg.to_s.html_safe
  end

  def mdc_headline(type)
    "<h#{type}>#{yield}</h#{type}>".html_safe
  end

  def mdc_select(name, id='', required=True)
    "<select class='mdc-select__native-control'#{' required' if required} #{"id=#{id}" if id}>#{yield}</select>".html_safe
  end
end
