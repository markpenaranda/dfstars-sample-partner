class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    super do
    	puts "here";
        resource.credits = 10000;
        resource.save
    end
  end
end