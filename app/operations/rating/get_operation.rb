module Rating
  class GetOperation
    attr_reader :technology, :user


    def initialize(technology, user = nil)
      @technology = technology
      @user = user
    end

    def user_rate
      rate = Rate.find_by(rateable: technology, rater: user)
      return rate ? rate.stars.to_i : nil
    end

    def avg_rate
      rate_catche = RatingCache.find_by(cacheable: technology)
      return rate_catche ? rate_catche.avg : nil
    end
  end
end
