module Slugifiable
  module InstanceMethods
    def slug
      (self.respond_to? :username) ? self.username.downcase.gsub(" ", "-") : self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find { |instance| instance.slug == slug }
    end
  end
end
