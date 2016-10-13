require 'spec_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'vote_notification' do
    let(:user) { instance_double User, name: 'Neo', email: 'neo@matrix.net' }
    let(:movie) { instance_double Movie, title: 'Matrix', user: user }
    let(:vote) { :like }
    let(:mail) { described_class.vote_notification(user, movie, vote).deliver }

    it 'renders the subject' do
      expect(mail.subject).to eq('Newest vote for your movie Matrix')
    end

    it 'renders the sender email' do
      pending("check Dotenv.load!")
      expect(mail.from).to eq(['thearchitect@matrix.net'])
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'assigns @movie.user.name' do
      expect(mail.body.encoded).to match(movie.user.name)
    end

    it 'assigns @movie.title' do
      expect(mail.body.encoded).to match(movie.title)
    end

    it 'assigns @vote' do
      expect(mail.body.encoded).to match(vote.to_s)
    end
  end
end
