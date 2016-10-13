class UserMailer < ActionMailer::Base
  default from: ENV["GMAIL_USERNAME"]

  def vote_notification(user, movie, vote)
    @user = user
    @movie = movie
    @vote = vote
    @url = "https://movierama.dev:24676"

    puts "UserMailer.vote_notification: new #{@vote} for #{movie.title} uploaded by #{movie.user.name}"
    mail(to: @movie.user.email, subject: "Newest vote for your movie #{@movie.title}")
  end
end
