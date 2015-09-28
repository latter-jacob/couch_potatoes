class UserMailer < ApplicationMailer
  default from: 'donotreply@askjeeves.com'
  def review_notification(user, reviewer, program)
    @user = user
    @reviewer = reviewer
    @program = program
    mail(
      to: @user.email,
      subject: "Your program has been reviewed"
    )
  end
end
