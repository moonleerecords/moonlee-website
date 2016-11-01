class NewsletterController < ApplicationController
  def subscribe
    gibbon = Gibbon::Request.new

    response = {
      message: 'User has been successfully subscribed.',
      status_code: 200
    }

    subscriber_email_address = params[:email]
    subscriber_country = params[:country]

    begin
      gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.create(
        body: {
          email_address: subscriber_email_address,
          status: 'subscribed',
          merge_fields: { COUNTRY: subscriber_country }
        }
      )
    rescue => e
      response[:message] = e.message
      response[:status_code] = 500
      Raven.capture_exception(e)
    end

    respond_to do |format|
      format.json { render json: response, status: response[:status_code] }
    end
  end
end
