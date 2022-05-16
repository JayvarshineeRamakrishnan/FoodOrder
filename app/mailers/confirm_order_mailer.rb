class ConfirmOrderMailer < ApplicationMailer
    default from: "notifications@foodorder.com"

    def order_confirmation
        @order = params[:order]
        @user = params[:user]
        @url = "http://localhost:3000/sign_in"
        mail(to: @user.email, subject: 'Order Confirmation')
    end
end
