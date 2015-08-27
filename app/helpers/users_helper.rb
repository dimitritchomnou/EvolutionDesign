module UsersHelper
	def user_menu_highlight(action)
    action == params['action'] ? 'highlight' : ''
  end

  def selected_params params, attribute, model=nil
    if params
      params[attribute]
    elsif model.present?
      model.send attribute
    else
      ""
    end
  end

  def checked_params(params, attribute, value, db_value , model=nil)
    if params and params[attribute] == value
      true
    elsif model.present? and (model.send(attribute) == db_value)
      true
    else
      false
    end    
  end

  def user_profile_picture(user)
    if user.media.present?
      display_image user.media
    else
      if user.M?
        image_tag "investisseur.png", class: "img-responsive"
      else
        image_tag "entrepreneur.png", class: "img-responsive"
      end
    end
  end
end
