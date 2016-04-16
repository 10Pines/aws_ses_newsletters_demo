Rails.application.routes.draw do
  mount AwsSesNewsletters::Engine, at: "/newsletters"
end
