class KeysController < ApplicationController
  skip_before_action :authenticate_user

  def public_key
    key_file = File.open(Rails.root.join('config/public.pem'), 'r:UTF-8')
    send_file key_file
  end
end
