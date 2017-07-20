require "paper_trail/version_concern"

module PaperTrail
  # This is the default ActiveRecord model provided by PaperTrail. Most simple
  # applications will only use this and its partner, `VersionAssociation`, but
  # it is possible to sub-class, extend, or even do without this model entirely.
  # See the readme for details.
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
