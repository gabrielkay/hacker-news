class PostValidator < ActiveModel::Validator
	def valid_url?(url)
		uri = URI.parse(url)
		uri.is_a?(URI::HTTP) && !uri.host.nil?
	rescue URI::InvalidURIError
		false
	end

	def validate(record)
		record.errors[:base] << 'You must submit a valid URL. You entered: ' + record.link unless valid_url?(record.link)
	end
end

class Post < ApplicationRecord
	validates_with PostValidator
end
