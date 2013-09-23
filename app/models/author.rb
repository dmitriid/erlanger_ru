class Author < ActiveRecord::Base
  belongs_to :resource
  include ResourceHelper

  def initials
    '' if self.name.nil?

    s = self.name.split
    one = s[0][0].upcase
    two = ''
    two = s[1][0].upcase unless s[1].nil?

    "#{one}#{two}"
  end
end
