module ApplicationHelper
  def image_url(source, options = {})
    url_to_asset(source, { type: :image }.merge!(options))
  end

end
