class ActivationMailer < ApplicationMailer
  default from: 'activation@example.com'

  def activation_mail
    @account = params[:account]

    mail(to: @account.email, subject: 'Register')
  end
end
