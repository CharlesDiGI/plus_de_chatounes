class OrderMailer < ApplicationMailer

  def order_recap(order)
    @order = order
    @items = @order.items
    @user = @order.user
    @url =  new_user_session_url

    # # each loop for inline attachement
    # @items.each { |item|
    #   attachments.inline["image"+item.id.to_s+".jpg"] = File.read(ActiveStorage::Blob.service.send(:path_for, item.image.key)) if item.image.attached?
    # }

    # attachement but not inline
    @items.each { |item|
      attachments["image"+item.id.to_s+".jpg"] = File.read(ActiveStorage::Blob.service.send(:path_for, item.image.key)) if item.image.attached?
    }

    # attachments.inline['0.jpg'] = File.read('app/assets/images/chatons/0.jpg')
    # <%= image_tag attachments['image.jpg'].url, alt: 'My Photo', class: 'photos' %>


# # inline attachements for the view files
# <% @items.each do |item| %>
#         <%= item.title %>
#         <%= image_tag(item.image.attached? ? attachments["image"+item.id.to_s+".jpg"].url : attachments['order.jpg'].url) %>

#          <%end %>

    mail(
      from: "no-reply-order@chatons.com",
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
      from: "no-reply-order@chatons.com",
      subject: "New Order from #{@user.first_name} #{@user.last_name} ",
      to: "admin_les_4_chatons@yopmail.com",
      delivery_method_options: { version: 'v3.1' }
    )
  end

end
