class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_webhook

  # Receives webhook from IFTTT when someone fills out our Google meeting sign in form
  def meeting_sign_in
    $nation_builder_client.call(:people, :push, person: person_params.to_h)
    head :created
  rescue NationBuilder::ClientError => e
    error = JSON.parse(e.message)['validation_errors'][0].capitalize rescue nil
    error ||= JSON.parse(e.message)['message']
    Rails.logger.error(error)
  end

  # Receives webhook from IFTTT when a new event is created on our Google Calendar
  def new_event
    event = event_params.to_h
    $nation_builder_client.call(:events, :create, site_slug: 'sacramentodsa', event: event)
    head :created
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

  def parse_location(location)
    first_number_index = location.index(location[/\d/])
    location_name = location[0..first_number_index - 1].strip.chomp(',')
    location_address = location[first_number_index..-1].chomp(', USA')
    address = StreetAddress::US.parse(location_address)
    return {
      'name': location_name,
      'address': {
        'address1': address.line1,
        'address2': address.unit,
        'city': address.city,
        'state': address.state,
        'zip': address.postal_code,
        'country_code': 'US'
      }
    }
  end

  def parse_date_time(date_time)
    date_time.in_time_zone('Pacific Time (US & Canada)').to_s
  end

  def rsvp_form
    {
      'phone': 'hidden',
      'address': 'hidden',
      'allow_guests': true,
      'accept_rsvps': true,
      'gather_volunteers': false
    }
  end

  def person_params
    params.permit(:email, :first_name, :last_name, :phone).tap do |person|
      person[:email] = person[:email].downcase.strip if person[:email].present?
      person[:first_name] = person[:first_name].strip if person[:first_name].present?
      person[:last_name] = person[:last_name].strip if person[:last_name].present?
      person[:phone] = person[:phone].gsub(/[^0-9]/, '') if person[:phone].present?
      person[:tags] = parse_tags(params[:committees])
    end
  end

  def event_params
    params.permit(:name, :intro, :venue, :start_time, :end_time, :published_at).tap do |event|
      event[:headline] = event[:name]
      event[:slug] = event[:name].parameterize(separator: '_')
      event[:venue] = parse_location(event[:venue])
      event[:start_time] = parse_date_time(event[:start_time])
      event[:end_time] = parse_date_time(event[:end_time])
      event[:published_at] = parse_date_time(event[:published_at])
      event[:time_zone] = 'Pacific Time (US & Canada)'
      event[:status] = 'published'
      event[:calendar_id] = 1
      event[:rsvp_form] = rsvp_form
    end
  end
end
