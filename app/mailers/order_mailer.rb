class OrderMailer < ApplicationMailer
	
	def order_recap(order)
		@order = order
		@items = @order.items
		@user = @order.user
		@url = "https://les-4-chatons-fantastiques.herokuapp.com/sign_in"

	mail(
    	from: "charles.digiampietro@gmail.com",
          subject: "Thanks for your order",
      to: @user.email,
      delivery_method_options: { version: 'v3.1' }
    )

	end

	def inform_admin(order)
		@order = order
		@items = @order.items
		@user = @order.user

	mail(
    	from: "charles.digiampietro@gmail.com",
          subject: "New Order from #{@user.first_name} #{@user.last_name} ",
      to: "admin_les_4_chatons@yopmail.com",
      delivery_method_options: { version: 'v3.1' }
    )
	end

end
