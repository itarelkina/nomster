class NotificationMailer < ApplicationMailer
    default from: "no-reply@nomsterapp.com"
  
    def comment_added
        @place = comment.place
        @place_owner = @place.user
      mail(to: "my@email.com",
      subject: "A comment has been added to #{@place.name}")
    end
  end