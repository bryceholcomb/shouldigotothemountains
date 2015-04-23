require '../test_helper'

describe Report do
  let(:valid_params) do
    {
      report_date: Date.new(2015, 2, 9),
      yesterday_snow_total: 12,
      mountain: 'Breckenridge'
    }
  end

  let(:report) { Report.new(valid_params) }

  it 'creates a valid report when params are valid' do
    report.must_be :valid?
  end

  it 'is invalid when yesterday_snow_total is missing' do
    valid_params.delete :yesterday_snow_total

    report.wont_be :valid?
    report.errors[:yesterday_snow_total].must_include("can't be blank")
  end

  it 'is invalid when yesterday_snow_total is not a number' do
    valid_params[:yesterday_snow_total] = 'asdf'

    report.wont_be :valid?
    report.errors[:yesterday_snow_total].must_include("is not a number")
  end


  it 'is invalid when mountain is missing' do
    valid_params.delete :mountain

    report.wont_be :valid?
    report.errors[:mountain].must_include("can't be blank")
  end
end
