class RequestMailer < ActionMailer::Base

  def request_visit_email(visit)
    recipients visit.artwork.contact.email 
    from "#{visit.from_name} <#{visit.from_email}>"  
    subject "Request to view artwork - #{visit.artwork.name}"
    sent_on Time.now
    body { :visit => visit, :artwork => visit.artwork, :contact => visit.artwork.contact } 
  end

end
