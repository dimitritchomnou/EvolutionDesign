class PagesController < ApplicationController

	def home
		#home
	end

	def about
		#about
	end

	def realisation
		#realisation
	end

	def expertise
		#expertise
	end


	def contact_post
    if params.values_at(:name, :phone, :email, :message).include? nil
      flash.now[:error] = 'Veuillez renseigner tous les champs du formulaire'
      render :contact
    else
      redirect_to contact_path(anchor: 'comfirmation')
      EvolutionDesignMailer.contact(params).deliver_now! rescue logger.warn('mail not sended')
    end
  end

end
