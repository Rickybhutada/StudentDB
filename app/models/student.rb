class Student < ApplicationRecord
  belongs_to :institution

  def self.search(search)
    if search[:stud_name].present? && search[:inst_name].present?
      eager_load(:institution).where('lower(full_name) LIKE ? OR lower(institutions.name) LIKE ?', "%#{search[:stud_name].downcase}%", "%#{search[:inst_name].downcase}%")
    elsif search[:stud_name].present?
      eager_load(:institution).where('lower(full_name) LIKE ?', "%#{search[:stud_name].downcase}%")
    elsif search[:inst_name].present?
      eager_load(:institution).where('lower(institutions.name) LIKE ?', "%#{search[:inst_name].downcase}%")
    else
      eager_load(:institution)
    end
  end
end
