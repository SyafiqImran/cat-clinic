class EmailService 
    # using SendGrid's Ruby Library
    # https://github.com/sendgrid/sendgrid-ruby
    require 'sendgrid-ruby'
    include SendGrid

    def self.send(recipient, subject, body)
        from = Email.new(email: 'catsfinalproject@gmail.com')
        to = Email.new(email: recipient)
        
        content = Content.new(type: 'text/plain', value: body)
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
    end
end