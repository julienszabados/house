class Apis::House::EventsController < Apis::AbstractController
  
  before_action :set_event_type
  
  EVENTS = [
    :burglar_detected,
    :sensor_living_room_low_battery
  ]
  
  RECIPIENTS = [
    '+33626702113',
    '+33666228541'
  ]
  
  HOUSE_NUMBER = '+33644608503'
  
  LOGS_FILE = Rails.root.join('files', 'api-house-events.logs')
  
  def new
    if @event_type && EVENTS.include?(@event_type)
      
      maid_cleaning_time = Date.today.tuesday? && (Time.now.hour >= 11 && Time.now.hour <= 18)
      if maid_cleaning_time
        open(LOGS_FILE, 'a') { |f|
          f.puts "#{Time.now} | Info :\n Femme de ménage détectée dans le salon"
        }
      else
        open(LOGS_FILE, 'a') { |f|
          f.puts "#{Time.now} | #{message_for_event_type(@event_type)}"
        }      

        ActionMailer::Base.mail(from: "house@js-projects.fr", to: ["julien.szabados@gmail.com", "sonia.hamrani@simplebo.fr"], subject: "House - Alerte", body: message_for_event_type(@event_type)).deliver_now        

        client = Twilio::REST::Client.new Settings.apis.twilio.account_sid, Settings.apis.twilio.auth_token

        RECIPIENTS.each do |recipient|
          client.api.account.messages.create(from: HOUSE_NUMBER, to: recipient, body: message_for_event_type(@event_type))          
        end
      end
    end

    render json: {}, response: :ok
  end
  
  private
  
  def set_event_type
    @event_type = params[:event_type].to_sym  if params[:event_type].present?
  end
    
  def message_for_event_type(event_type)
    case event_type
      when :burglar_detected
        "Alerte !\n Un intrus a été détecté dans le salon pendant votre absence."
      when :sensor_living_room_low_battery
        "Attention ! \n La batterie du sensor du salon est à 20%."
    end
  end
  
end