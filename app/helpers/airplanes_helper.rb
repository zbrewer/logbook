module AirplanesHelper

  # Helper function that displays a check if the boolean is true
  # and an X if the boolean is false
  def display_boolean_icon(value)
    if value
      content_tag(:i, :class => "fa fa-check text-success") do
      end
    else
      content_tag(:i, :class => "fa fa-times text-danger") do
      end
    end
  end

end
