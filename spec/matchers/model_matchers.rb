module ModelMatchers
	class ValidAttributeMatcher
		def initialize attr_symbol
			@attr_symbol = attr_symbol
		end
		def matches? model_object
			model_object.valid? # just to trigger.  Verifying this would be the wrong level of granularity.
			not model_object.errors.invalid?(@attr_symbol)
		end
		def failure_message
			"\n#{@attr_symbol} should have been valid.\n\n"
		end
	end

	class InvalidAttributeMatcher
		def initialize attr_symbol, expected_error_msg
			@attr_symbol, @expected_error_msg = attr_symbol, expected_error_msg
		end

		# This method calls model_object.valid? merely to trigger validation.  It is not interested in checking whether the object
		# as a whole is valid or not.  It is more interested in the targeted validation of whether the specified attribute on the object
		# is valid or not, and subsequently, whether the validation error message is as expected.
		def matches? model_object
			model_object.valid? # just calling this to trigger validation.  We are going to validate the attribute level of granularity.
			if @invalid = model_object.errors.invalid?(@attr_symbol)
				@actual_error_msg = model_object.errors[@attr_symbol]
				@matched_error_msg = @actual_error_msg.to_a.include?(@expected_error_msg)
			end
			@invalid && @matched_error_msg
		end

		def failure_message
			if @invalid
				msg = "Wrong error message.\nExpected: #{@expected_error_msg}\n But Was: #{@actual_error_msg}"
			else
				msg = "#{@attr_symbol} should not have been valid."
			end
			"\n#{msg}\n\n"
		end
	end

	def have_valid_attribute attr_symbol
		ValidAttributeMatcher.new attr_symbol
	end

	def have_invalid_attribute attr_symbol, expected_error_msg
		InvalidAttributeMatcher.new attr_symbol, expected_error_msg
	end
end