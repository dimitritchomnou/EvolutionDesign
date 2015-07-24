class EvolutionDesignMailer < ApplicationMailer

	def contact(params)
    @name, @phone, @email, @message = params.values_at(:name, :phone, :email, :message)
    mail subject: "Prise de contact"
  end

end
