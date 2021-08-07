class SendMail < ApplicationJob

    def perform(*)

        quotesCloudInstance = Quote.order("quoteindex DESC").limit(5)

        words = []

        quotesCloudInstance.each do |item|
            words.push [item['title'], item['quoteindex'] + 50 ]
        end

        cloudResult = MagicCloud::Cloud.new(words, rotate: :free, scale: :log)

        img = cloudResult.draw(960, 600)
        img.write('test.png')
    
        @order = Order.new(name: "abc", email: "jskudrys@gmail.com", address: "jskudrys@gmail.com", phone: "123456789", message: "assd")
        @order.save

        p "ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"

        QuotesCloudMailer.with(order: @order).magic_cloud_email.deliver_later
    end
end
