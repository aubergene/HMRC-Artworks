#!/usr/bin/env ruby
require File.expand_path('../../config/environment',  __FILE__)
require 'yaml'

POSTCODE_REGX = /[A-Z]{1,2}[0-9R][0-9A-Z]?\s*[0-9][ABD-HJLNP-UW-Z]{2}/i
 
  def extract_postcode(text)
    return unless text
    text = text.strip.sub(/\bo(\w\w)$/i,'0\1') # replace o with zero
    postcode = text[POSTCODE_REGX]
    return nil unless postcode
    postcode.gsub(/\s+/,'').insert(-4,' ').upcase 
  end
 
  def extract_phone(text,phone)
    return phone if (phone and phone != "")
    p_nums = text.scan(/(?:\+44)?[ 0-9\(\)\-]{10,16}/) # UK phone numbers min/max length (incluing bracket, etc.)
    p_nums.map { |x| x.gsub!(/\D/,'') }
    p_nums.reject! { |x| x.nil? || x.empty? || x.length < 10 }
    p_nums.each do |num|
      num.sub!(/^44/,'')
      num = case num
        when /^02/ # London (020), Southhampton & Portsmouth (023), Coventry (024), Northern Ireland (028), Cardiff (029)
          num.insert(3,') ').insert(9,' ')
        when /^08/, /^011/, /^01[2-6,9]1/ #
          num.insert(4,') ')
        when /^01697[3,4,7]/ # Brampton *still* has four digit numbers, go Brampton!
          num.insert(6,') ')
        else
          num.insert(5,') ')
      end
      num.insert(0,'(')
    end
  end

yaml = Dir.glob("scrape_parse1/*.yaml")
yaml.each do |file|
  artwork_atts = YAML::load_file(file)
  
  contact = Contact.find_by_name_and_address(artwork_atts["contact_name"],artwork_atts["contact_address"])
  unless contact
    contact = Contact.create (
      :name => artwork_atts["contact_name"],
      :address => artwork_atts["contact_address"],
      :email => artwork_atts["email"],
      :fax => artwork_atts["fax"],
      :postcode => extract_postcode(artwork_atts["contact_address"]),
      :phone => extract_phone(artwork_atts["contact_address"],artwork_atts["telephone_no"])
    )
  end
  
  art = contact.artworks.create(
    :hmrc_id => artwork_atts["unique_id"].to_i,
    :category => artwork_atts["category"],
    :description => artwork_atts["description"],
    :access_details => artwork_atts["access_details"]
  )
  
end