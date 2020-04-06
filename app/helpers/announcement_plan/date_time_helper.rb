module AnnouncementPlan
	module DateTimeHelper
	    def nldt(datetime)
	      datetime.strftime( '%d %b %Y %H:%M') if datetime
	    end
	    alias :nldatetime :nldt 


	    def nld(date)
	      date.strftime( '%d %b %Y') if date
	    end
	    alias :nldate :nld

 	    def nld_ui(date)

	      date.strftime( '%d-%m-%Y') if date
	    end

	end
end