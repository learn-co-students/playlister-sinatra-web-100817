module Slugifiable
  module Slug
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module FindBySlug
    def find_by_slug(slug)
      name = slug.gsub("-", " ").split(" ").map do |n| 
        !n.match(/((with)|(the)|(\ba\b))/) ? n.capitalize : n
      end.join(" ")
      self.find_by(name: name)
    end
  end
end