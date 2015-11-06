task :fake_order => :environment do
  Pusher.trigger('new_orders', 'order', {
    firstName: 'Tim',
    quantity: '2',
    type: '24 Pack(s)'
  })
end
