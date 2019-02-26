class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_webhook

  def meeting_sign_in
    $nation_builder_client.call(:people, :push, person: sign_in_params.to_h)
  rescue NationBuilder::ClientError => e
    error = JSON.parse(e.message)['validation_errors'][0].capitalize rescue nil
    error ||= JSON.parse(e.message)['message']
    Rails.logger.error(error)
  end

  protected

  def authorize_webhook
    head :unauthorized unless params[:authorization] == ENV['WEBHOOK_AUTH_TOKEN']
  end

  def parse_tags(committee_list)
    committees = committee_list.split(', ')
    [].tap do |tags|
      committees.each { |committee| tags.push(COMMITTEE_TAGS[committee.to_sym]) }
    end
  end

  def sign_in_params
    params.permit(:email, :first_name, :last_name, :phone).tap do |person|
      person[:email] = person[:email].downcase.strip if person[:email].present?
      person[:first_name] = person[:first_name].strip if person[:first_name].present?
      person[:last_name] = person[:last_name].strip if person[:last_name].present?
      person[:phone] = person[:phone].gsub(/[^0-9]/, '') if person[:phone].present?
      person[:tags] = parse_tags(params[:committees])
    end
  end
end
