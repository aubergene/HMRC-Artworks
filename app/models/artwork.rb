class Artwork < ActiveRecord::Base

  belongs_to  :contact
  has_many    :visit_requests
  
  def categorize
    case self.category
    when 'Books & Manuscripts'
      '[BOOK]'
    when 'European Ceramics & Glass'
      '[CERAMIC]'
    when 'Metalwork and Silver'
      '[METAL]'
    when 'Miscellaneous'
      ''
    when 'Paintings & Miniatures'
      '[PAINT]'
    when 'Prints and Drawings'
      '[PRINT]'
    when 'Watches & Sci.Instruments'
      '[SCIENCE]'
    else 
      '['+self.category.upcase+']'
    end
  end

  def friendly_html_description
    self.description
  end

end
