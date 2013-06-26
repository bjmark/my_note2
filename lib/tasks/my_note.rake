# -*- encoding: utf-8 -*-
namespace :my_note do
  desc 'Start a process to handle background jobs'
  task :background_job => :environment do
    while true
      begin
        BackgroundJob.all.each do |e|
          case e.job['name']
          when 'build_content_index'
            ContentIndex.add_note(e.job['note_id'],e.job['content'])
          when 'update_content_index'
            ContentIndex.update_note(e.job['note_id'],e.job['content'])
          end
          e.destroy
        end
      rescue Exception => error
        #Log("workflow_storage", error.to_s)
        puts error
        puts error.backtrace
      end
      sleep(1)
    end
  end
end
