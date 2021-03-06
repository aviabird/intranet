FactoryGirl.define do
  factory :user do |u|
    role { 'Employee' }
    sequence(:email) { |n| "emp#{n}@#{ORGANIZATION_DOMAIN}" }
    password { Faker::Internet.password }
    before(:create) { |user| 
      user.public_profile = FactoryGirl.create(:public_profile, user: user)
      user.private_profile = FactoryGirl.create(:private_profile, user: user)
    }
  end

  factory :super_admin, class: User, parent: :user do |u|
    role { 'Super Admin' }
    sequence(:email) { |n| "superadmin#{n}@#{ORGANIZATION_DOMAIN}" }
    password { Faker::Internet.password }
  end

  factory :admin, class: User, parent: :user do |u|
    role { 'Admin' }
    sequence(:email) { |n| "admin#{n}@#{ORGANIZATION_DOMAIN}" }
    password { Faker::Internet.password }
  end

  factory :hr, class: User, parent: :user do |u|
    role { 'HR' }
    sequence(:email) { |n| "hr#{n}@#{ORGANIZATION_DOMAIN}" }
    password { Faker::Internet.password }
  end

  factory :employee, class: User do
    role { 'Employee' }
    email { "employee@#{ORGANIZATION_DOMAIN}" }
    password { Faker::Internet.password }
  end

  factory :manager, class: User do
    role { 'Manager' }
    email { "manager@#{ORGANIZATION_DOMAIN}" }
    password { Faker::Internet.password }
  end

end
