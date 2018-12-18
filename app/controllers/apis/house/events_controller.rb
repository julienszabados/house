class Apis::House::EventsController < Apis::AbstractController
  
  before_action :set_notification_type
  
  EVENTS = [
    :burglar_detected,
    :sensor_living_room_low_battery
  ]
  
  RECIPIENTS = [
    '+33626702113',
    '+33666228541'
  ]
  
  LOGS_FILE = Rails.root.join('files', 'api-house-events.logs')
  
  def new
    if @event_type && EVENTS.include?(@event_type)
      
      maid_cleaning_time = Date.today.tuesday? && (Time.now.hour >= 11 && Time.now.hour <= 18)
      if maid_cleaning_time
        open(LOGS_FILE, 'a') { |f|
          f.puts "IP : #{request.remote_ip} \n"
          f.puts "Time: #{Time.now} \n"
          f.puts "Event : Femme de ménage détectée dans le salon. \n"
          f.puts "----- \n"
        }
      else
        open(LOGS_FILE, 'a') { |f|
          f.puts "#{Time.now} | #{message_for_notification_type(@event_type)}"
        }      
#         ActionMailer::Base.mail(from: "notifications-house@origa-print.fr", to: ["julien.szabados@gmail.com", "sonia.hamrani@simplebo.fr"], subject: "Alert", body: message_for_notification_type(@event_type)).deliver_now        
#         account_sid = 'ACce20fbad3f1551f15076f6697ee79a4c'
#         auth_token = 'edd6c86b46d54d31416a6150245d2fd1'
#         house_number = '+33644608503'
#         @client = Twilio::REST::Client.new account_sid, auth_token
#         RECIPIENTS.each do |recipient|
#           @client.api.account.messages.create(from: house_number, to: recipient, body: message_for_notification_type(@event_type))          
#         end
      end
    end

    render json: {}, response: :ok
  end
  
  private
  
  def set_notification_type
    @event_type = params[:event_type].to_sym  if params[:event_type].present?
  end
    
  def message_for_notification_type(event_type)
    case event_type
      when :burglar_detected
        "Alerte ! \n Un intrus a été détecté dans le salon pendant votre absence."
      when :sensor_living_room_low_battery
        "Attention ! \n La batterie du sensor du salon est à 20%."
    end
  end
  
end