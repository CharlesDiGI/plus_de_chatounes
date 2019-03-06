class OrderMailer < ApplicationMailer

  def order_recap(order)
    @order = order
    @order_item = OrderItem.where(order_id: order.id)
    @item = @order_item.id.items.first.item
    # @item = @order_item.item
    @user = @order.user
    @url = "https://les-4-chatons-fantastiques.herokuapp.com/sign_in"

puts "*" * 50
puts @order.id
puts @order_item
puts @item
# puts @item.title
puts @user.first_name
puts "*" * 50
    # @items.each do |item|
    #   image_tag attachments['image.jpg'].url, alt: 'My Photo', class: 'photos'
    # end
    # @items.each { |e|
      # attachments.inline['order.jpg'] = image_tag(item.image)
    # }

    attachments.inline['0.jpg'] = File.read('app/assets/images/chatons/0.jpg')

    mail(
      from: "charles.digiampietro@gmail.com",
      subject: "Thanks for your order",
      to: @user.email,
      delivery_method_options: { version: 'v3.1' }
    )

    # <% @items.each do |item| %>
    #      <%= image_tag attachments['image.jpg'].url, alt: 'My Photo', class: 'photos' %>
    #      <%end %>
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
