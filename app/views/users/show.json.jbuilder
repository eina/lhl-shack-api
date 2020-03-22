json.key_format! camelize: :lower
# json.extract! landlord, *landlord.attributes.keys
# json.extract! @user, :first_name, :last_name, :phone_number, :email, :password

json.user @user do |detail|
  json.(detail, :first_name, :last_name, :phone_number, :email, :password)
  json.household detail.households
end