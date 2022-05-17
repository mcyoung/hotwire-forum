class UserMailer < ApplicationMailer
  def new_post_notification
    @user = params[:recipient]
    @post = params[:post]

    mail to:      @user.email,
         subject: "There's been a new reply in #{@post.discussion.name}."
  end
end
