class VisitRequest < ActiveRecord::Base

  belongs_to :artwork

  def after_create
    logger.info "Would send email at this point"
    #RequestMailer.deliver_request_visit_email(visit)
  end 

end
