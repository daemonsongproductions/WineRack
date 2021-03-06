class GlassesService

  AddAGlassResponse = ImmutableStruct.new(:glass, :error)

  def glasses_for_user(user_id:, page:)

    Glass.where(user_id: user_id).order(:date) #page(page).per(50).order(:date)

  end

  def add_a_glass_for_freedom(wine_name:, vintage:, winemaker_name:, date:, rating:, notes:, user_id:)

    winemaker = Winemaker.find_or_create_by(name: winemaker_name)

    wine = Wine.find_or_create_by!(name: wine_name, vintage: vintage) do |wine|
      wine.winemaker_id = winemaker.id
    end

    glass = Glass.create!(wine_id: wine.id, user_id: user_id, date: date, rating: rating, notes: notes)

    AddAGlassResponse.new(glass: glass)

  rescue StandardError => e
    AddAGlassResponse.new(error: e.message)

  end

end