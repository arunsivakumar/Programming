
from twilio.rest import TwilioRestClient

account_sid = "AC16a782760291c24a7526ff80e89504e7" # Your Account SID from www.twilio.com/console
auth_token  = "37705b9435e4f7157a7708fc2cc8fec6"  # Your Auth Token from www.twilio.com/console

client = TwilioRestClient(account_sid, auth_token)

message = client.messages.create(body="Hello from Python",
    to="+14357646370",    # Replace with your phone number
    from_="+16282276533") # Replace with your Twilio number

print(message.sid)
