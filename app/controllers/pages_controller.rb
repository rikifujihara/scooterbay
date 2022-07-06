class PagesController < ApplicationController
  def home
    @category_info = [
      offroad = {title: 'Off-Road', description: 'Scooters built for rough terrain', pic: "https://scooterbay-public-images.s3.ap-southeast-2.amazonaws.com/offroad.jpeg", link: 'listings/offroad'},
      high_speed = {title: 'High-Speed', description: 'Powerful scooters with high top speeds and acceleration', pic: "https://scooterbay-public-images.s3.ap-southeast-2.amazonaws.com/highspeed.jpg", link: 'listings/highspeed'},
      kids = {title: 'Kids Scooters', description: 'Smaller scooters suitable for children', pic: "https://scooterbay-public-images.s3.ap-southeast-2.amazonaws.com/kids-scooter.jpeg", link: 'listings/kids'},
      offroad = {title: 'Commuter', description: 'Scooters for ideal for short-medium trips on paved terrain', pic: "https://scooterbay-public-images.s3.ap-southeast-2.amazonaws.com/commuter.jpg", link: 'listings/commuter'}
  ]
  end
end
