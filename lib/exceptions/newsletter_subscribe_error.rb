module Exceptions
  class NewsletterSubscribeError < StandardError
    def initialize(msg='Erorr while adding a subscriber to Mailchimp list')
      super
    end
  end
end
