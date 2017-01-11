class NewsletterController < ApplicationController
  def subscribe
    response = subscribe_member

    respond_to do |format|
      format.json { render json: response, status: response[:status_code] }
    end
  end

  private

  # rubocop:disable Metrics/MethodLength
  def subscribe_member
    gibbon = Gibbon::Request.new

    response = {
      message: 'User has been successfully subscribed.',
      status_code: 200
    }

    if params[:email].empty? || params[:country].empty?
      response[:message] = 'Missing e-mail or country.'
      response[:status_code] = 500

      return response
    end

    begin
      gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.create(
        body: {
          email_address: params[:email],
          status: 'subscribed',
          merge_fields: { COUNTRY: params[:country] }
        }
      )
    rescue StandardError => e
      Raven.capture_exception(e)
      response[:message] = e.title
      response[:status_code] = 500
    end

    response
  end
end
