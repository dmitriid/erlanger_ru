class Url < ActiveRecord::Base

  include LinkableMaterial
  def linkable_material_type
    RESTYPE[:url]
  end
end
