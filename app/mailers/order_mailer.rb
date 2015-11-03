class OrderMailer < ApplicationMailer
  def order(params)
    @params = params
    mail(to: 'ageoldpun@gmail.com', subject: 'Someone bought some of your cola')
  end
end
