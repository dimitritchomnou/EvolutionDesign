module PagesHelper
	def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end

  def video_embed(url)
    youtube = false
    if url[/youtu\.be\/([^\?]*)/]
      id = $1
      youtube = true
    elsif url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      id = $5
      youtube = true
    elsif url[/dailymotion\.com\/video\/([a-zA-Z0-9]*)_/] || url[/dai\.ly\/([a-zA-Z0-9]*)/]
      id = $1
    end
    
    url = if youtube
      "https://www.youtube.com/embed/#{ id }"
    else
      "https://www.dailymotion.com/embed/video/#{ id }"
    end  
    
    %Q{<iframe title="video player" width="100%" height="400px" src="#{ url }" frameborder="0" allowfullscreen></iframe>}.html_safe
  end

  def active_link(action, controller)
    action.eql?(action_name) && controller_name.eql?(controller) ? 'active' : nil
  end

  def user_area_header_highlight(role)
    url = URI.parse(request.original_url)
    paths = url.path.split "/"
    'active' if logged_in? and current_user.role == role and paths.include? "mon-espace-personnel"
    'active' if logged_in? and current_user.role == role and paths.include? "mon-espace-personnel"
  end

  def display_image(media, width=nil, klass=nil)
    if media.present?
      image_tag url_for( root_path << "medias/display/#{media.id}"),  class: "img-responsive #{klass}", width: width
    end
  end 

  def display_resize_image(media, width, height=nil)
    if media.present?
      image_tag url_for( root_path << "medias/display/#{media.id}/#{width}/#{height}"),  class: 'img-responsive', width: "100%"
    end
  end

  def media_url(media)
    if media.present?
      root_path << "medias/display/#{media.id}"
    end
  end

  def link_to_linkedin(member)
    member.linkedin.present? ? "#{ member.linkedin },  target: '_blank'" : "#"
  end

  def objective_background(index)
    colors = {0 => "yellow", 1 =>"blue", 2 => "navy", 3 => "grey"}
    if index > 3
      index %=4 
    end
    colors[index]
  end

  def min_font_size(value)
    "font-size:0.91em;" if value < 12
  end

  def breadcrumb_link(name, title, path)
    if name == controller_name
      title
    else
      link_to title, path
    end
  end

  def is_active(action)       
    params[:action] != action ? "active" : nil        
  end

  def active_breadcrumb(name)
    name.eql?(controller_name) ? 'active' : nil
  end
  
end
