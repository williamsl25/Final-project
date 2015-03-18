module CbmsHelper
  def cbm_chart_data
    # (12.weeks.ago.to_date..Date.today).map do |date|
    #   # Cbm.where("date(date_taken) = ?")
    #   { date_taken: date, cbm: 10 }
    # end

    # Check to see if your graph works for 
    # more then 1 CBM

    # Get all of the students CBM's being displayed
    # a = []
    # student = Student.all
    # cbm = Cbm.all

    @student.cbms.map do |cbm|
      { date_taken: cbm.date_taken, cbm: cbm.score }
    end
  end

end
