class SubscribeUserToMailingListJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    gibbon = Gibbon::Request.new(api_key: ENV["MAILCHIMP_API_KEY"])
    gibbon.lists(ENV["MAILCHIMP_LIST_ID"]).members.create(body: {email_address: "#{user.email}", status: "subscribed", merge_fields: {FNAME: "#{user.name}", LNAME: "#{user.name}"}})
  end
end
