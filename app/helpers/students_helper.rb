module StudentsHelper
  def sort_column(column)
    title = column.titleize
    column_order = get_order == "asc" ? "desc" : "asc"
    link_to title,{:sort=> column, :direction=> column_order, :student_name=> @student_name,:institution_name=> @institution_name }
  end

  def get_column
    col = params[:sort] || "full_name"
    col == "institution" ? "institutions.name" : col
  end

  def current_column
    col = params[:sort] || "full_name"
  end

  def get_order
    params[:direction] || "asc"
  end
end
