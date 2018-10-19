require 'date'
require 'project_reimbursement/project'

module ProjectReimbursement
  class ReimbursementService
    LOW_COST_CITY_TRAVEL_DAY_AMT = 45
    HIGH_COST_CITY_TRAVEL_DAY_AMT = 55
    LOW_COST_CITY_FULL_DAY_AMT = 75
    HIGH_COST_CITY_FULL_DAY_AMT = 85

    def initialize(projects)
      @projects = projects
    end

    def execute
      # arrange ProjectDays by date
      # determine travel/full days
      # throw out same days, keep higher
      # sum up days for total reimbursement
    end

  end
end
