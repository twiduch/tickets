class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_ticket(email, id, url)
    @id = id
    @url = url
    mail(to: email, subject: 'New support ticket')
  end
  
  def staff_response(email, id, url, message)
    @id, @url, @message = id, url, message
    mail(to: email, subject: "Message for your ticket #{id}")
  end
end
