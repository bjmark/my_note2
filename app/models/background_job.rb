class BackgroundJob < ActiveRecord::Base
  serialize :job, Hash
  attr_accessible :job

  def job
    read_attribute(:job) || write_attribute(:job, {})
  end
end
