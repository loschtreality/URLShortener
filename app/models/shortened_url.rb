class ShortenedUrl < ActiveRecord::Base

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

    has_many :visits,
      primary_key: :id,
      foreign_key: :shortened_url_id,
      class_name: :VisitedUrl

    has_many :visitors,
      through: :visits,
      source: :visitor

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(user_id: user.id, short_url: ShortenedUrl.random_code, long_url: long_url)
  end

  def num_clicks
    ShortenedUrl.all.select(:user_id).distinct.size
  end

end
