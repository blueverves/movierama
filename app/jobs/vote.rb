class Vote
  @queue = :votes_queue

  def self.perform(movie_id, vote)
    movie = Movie[movie_id]
    puts "Vote.perform: new #{vote} for #{movie.title} uploaded by #{movie.user.name}"
    UserMailer.vote_notification(movie.user, movie, vote).deliver!
  end
end
