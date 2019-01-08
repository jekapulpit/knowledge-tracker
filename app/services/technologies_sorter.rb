class TechnologiesSorter
  SUPPORTED = %w[
    average_mark-desc
    average_mark-asc
    views-desc
    created_at-desc
    created_at-asc
  ].freeze

  def initialize(value)
    @value = value
  end

  def apply_on(relation)
    unless SUPPORTED.include?(@value)
      relation.order(views: :desc)
      return relation
    end

    column, direction = @value.split('-')

    relation.order("#{column} is null, #{column} #{direction}")
  end
end