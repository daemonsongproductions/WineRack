class GlassesService

  AddAGlassResponse = ImmutableStruct.new(:glass, :error)

  def add_a_glass_for_freedom(wine_name:, vintage:,  date:, rating:, notes:, user_id:)
    wine = Wine.find_or_create_by!(name: wine_name, vintage: vintage)

    glass = Glass.create!(wine_id: wine.id, user_id: user_id, date: date, rating: rating)

    AddAGlassResponse.new(glass: glass)

  rescue StandardError => e
    AddAGlassResponse.new(error: e.message)

  end

end