class CommentMailer < ApplicationMailer
  default from: 'wilminhasilva@gmail.com'

  def notify_new_comment
    @comment = params[:comment]

    mail(to: @comment.photo.user.email, subject: "Você recebeu um novo comentário.")
  end
end
