class OrderMailer < ApplicationMailer

  def order_recap(order)
    @order = order
    @items = @order.items
    @user = @order.user
    @url = "https://les-4-chatons-fantastiques.herokuapp.com/sign_in"

    @items.each { |item|
      attachments.inline["image"+item.id.to_s+".jpg"] = File.read(ActiveStorage::Blob.service.send(:path_for, item.image.key)) if item.image.attached?
    }
    # image_tag(item.image)
    # de 42 à 61

    # attachments.inline['0.jpg'] = File.read('app/assets/images/chatons/0.jpg')
    # <%= image_tag attachments['image.jpg'].url, alt: 'My Photo', class: 'photos' %>

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
