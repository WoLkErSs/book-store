class GetBooksByCategoryService
  def initialize(category_id, current_filter)
    @filter = current_filter
    @category_id = category_id
  end

  def call
    return Book.where(category_id: @category_id).selection_by_order(SelectionByFilterService::FILTERS.key(@filter).to_s) if @category_id
    Book.all.selection_by_order(SelectionByFilterService::FILTERS.key(@filter).to_s)
  end
end
