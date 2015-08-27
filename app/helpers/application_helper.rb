module ApplicationHelper
	def flash_class(name)
    case name
      when 'notice'
        'success'
      when 'error'
        'danger'
      when 'warning'
        'warning'
      when 'info'
        'info'
      else
        'danger'
    end
  end

  def clear_boolean value
    value ? "Oui" : "Non"
  end

  def download_media(id)
    root_path + "medias/download/#{id}"
  end

  def clear_status(status)
    "#{status.downcase}_status"
  end

  def display_media(id)
    root_path + "medias/display/#{id}"
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def new_investor
    Investor.new(role: 2)
  end

  def user_on_admin(user)
    case user.role
    when 'Administrator'
      administration_administrator_path(user)
    when 'Investor'
      administration_investor_path(user)
    when 'Entrepreneur'
      administration_entrepreneur_path(user)
    else
      root_path
    end
  end
end
