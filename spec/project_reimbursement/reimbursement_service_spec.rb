require 'project_reimbursement/project'
require 'project_reimbursement/reimbursement_service'

module ProjectReimbursement

  describe ReimbursementService do

    describe '#execute' do

      # Set 1
      context 'one project' do
        it 'returns the total reimbursement' do
          projects = [
              Project.new(Date.new(2015, 9, 1), Date.new(2015, 9, 3), false)
          ]

          service = ReimbursementService.new(projects)
          expect(service.execute).to eq(165)
        end
      end

      # Set 2
      context 'three projects, no gaps in days, 1 overlapping day' do
        it 'returns the total reimbursement' do
          projects = [
              Project.new(Date.new(2015, 9, 1), Date.new(2015, 9, 1), false),
              Project.new(Date.new(2015, 9, 2), Date.new(2015, 9, 6), true),
              Project.new(Date.new(2015, 9, 6), Date.new(2015, 9, 8), false)
          ]

          # service = ReimbursementService.new(projects)
          # expect(service.execute).to eq(590)
        end
      end

      # Set 3
      context 'three projects, 1 gap in days' do
        it 'returns the total reimbursement' do
          projects = [
              Project.new(Date.new(2015, 9, 1), Date.new(2015, 9, 3), false),
              Project.new(Date.new(2015, 9, 5), Date.new(2015, 9, 7), true),
              Project.new(Date.new(2015, 9, 8), Date.new(2015, 9, 8), true)
          ]

          # service = ReimbursementService.new(projects)
          # expect(service.execute).to eq(445)
        end
      end

      # Set 4
      context 'four projects, no gaps in days, 1 overlapping day' do
        it 'returns the total reimbursement' do
          projects = [
              Project.new(Date.new(2015, 9, 1), Date.new(2015, 9, 1), false),
              Project.new(Date.new(2015, 9, 1), Date.new(2015, 9, 1), false),
              Project.new(Date.new(2015, 9, 2), Date.new(2015, 9, 2), true),
              Project.new(Date.new(2015, 9, 2), Date.new(2015, 9, 3), true)
          ]

          # service = ReimbursementService.new(projects)
          # expect(service.execute).to eq(185)
        end
      end
    end

  end

end
