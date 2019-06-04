module UrlEx
	def url_extender(str)
		str = "http://" + str if str.substr(0,4) != "http"
	end
end