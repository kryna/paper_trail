require 'paper_trail/version_concern'

module PaperTrail
  class Version < ::ActiveRecord::Base
    include PaperTrail::VersionConcern

    def id_serialized
      "#{id}&PaperTrail::Version"
    end

    def version_date
      self.reify.updated_at.try(:strftime, "%d.%m.%Y %H:%M")
    end
  end
end
