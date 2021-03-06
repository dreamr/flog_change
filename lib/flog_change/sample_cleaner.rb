require 'flog_change'

module FlogChange
  class SampleCleaner
    def self.clean
      files_to_delete = FlogChange::App.samples.map do |sample|
        timestamp = timestamp_from_sample_filename(sample)
        sample if old_timestamps.include? timestamp
      end.reject {|f| f.nil?}

      delete_files files_to_delete
    end

    def self.old_timestamps
      timestamps = FlogChange::App.samples.map do |sample| 
        timestamp_from_sample_filename sample
      end
      timestamps.sort {|a,b| b <=> a}[1..-1]
    end

    def self.delete_files(files)
      files.each {|file| File.delete(file)}
    end

    def self.timestamp_from_sample_filename(sample)
      sample.split("/")[-1].gsub(".sample",'')
    end
  end
end
