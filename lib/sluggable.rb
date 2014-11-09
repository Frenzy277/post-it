module Sluggable  
  extend ActiveSupport::Concern

  included do
    before_save :generate_slug!
    class_attribute :slug_column
  end

  def to_param
    self.slug
  end

  def generate_slug!
    the_slug = self.send(self.class.slug_column.to_sym).parameterize
  
    while self.class.where(slug: the_slug).exists?
      if the_slug.split('-').last.to_i != 0
        the_slug = "#{the_slug.split('-').slice(0...-1).join('-')}-#{the_slug.split('-').last.to_i + 1}"
      else
        the_slug += "-2"
      end
    end
    self.slug = the_slug
  end
      
  module ClassMethods
    def sluggable_column(col_name)
      self.slug_column = col_name
    end
  end
end