#
# open_activity.rb
# ConstantContact
#
# Copyright (c) 2013 Constant Contact. All rights reserved.

module ConstantContact
	module Components
		class OpenActivity < Component
			attr_accessor :activity_type, :campaign_id, :email_address, :open_date, :contact_id


			# Factory method to create an OpenActivity object from an array
			# @param [Hash] props - hash of properties to create object from
			# @return [OpenActivity]
			def self.create(props)
				open_activity = OpenActivity.new
				if props
					props.each do |key, value|
						open_activity.send("#{key}=", value)
					end
				end
				open_activity
			end

		end
	end
end