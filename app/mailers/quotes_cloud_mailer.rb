class QuotesCloudMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def magic_cloud_email
        @order = params[:order]

        mail(to: "jskudrys@gmail.com", subject: "You got a new order!")
    end
end
