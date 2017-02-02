require 'rails_helper'

describe GlassesService do
  let(:service) { GlassesService.new }
  let(:user)  { FactoryGirl.create(:user) }
  let(:wine_name) { "Chemin de Fer" }
  let(:vintage) { "2013" }
  let(:winemaker_name) { "Lasseter Family Winery" }
  let(:rating) { 5 }

  describe "#add_a_glass_for_freedom" do

    def add_that_glass
      service.add_a_glass_for_freedom(wine_name: wine_name,
                                      vintage: vintage,
                                      winemaker_name: winemaker_name,
                                      date: Date.today,
                                      rating: rating,
                                      notes: nil,
                                      user_id: user.id)
    end


    context "wine does not already exist" do

      context "winemaker already exists" do

        let!(:winemaker) { FactoryGirl.create(:winemaker, name: winemaker_name) }

        it "should add a wine with the existing winemaker and add a glass" do
          response = add_that_glass
          expect(response.glass).to_not eq(nil)
          expect(Wine.find(response.glass.wine.id).name).to eq(wine_name)
          expect(Winemaker.find(response.glass.wine.winemaker.id)).to eq(winemaker)
        end

      end

      context "winemaker does not already exist" do

        it "should add a wine with a new winemaker and add a glass" do
          response = add_that_glass
          expect(response.glass).to_not eq(nil)
          expect(Wine.find(response.glass.wine_id).name).to eq(wine_name)
          expect(Winemaker.find(response.glass.wine.winemaker.id).name).to eq(winemaker_name)
        end
      end

    end

    context "wine with same name but different vintage exists" do

      let!(:winemaker) { FactoryGirl.create(:winemaker, name: winemaker_name) }
      let!(:wine) { FactoryGirl.create(:wine, name: wine_name, vintage: "1000") }

      it "should create a new wine and add a glass" do
        response = add_that_glass
        expect(response.glass).to_not eq(nil)
        expect(Wine.find(response.glass.wine_id)).to_not eq(wine)
        expect(response.glass.wine.name).to eq(wine_name)
        expect(response.glass.wine.vintage).to eq(vintage)
      end

    end

    context "wine already exists" do
      let!(:winemaker) { FactoryGirl.create(:winemaker, name: winemaker_name) }
      let!(:wine) { FactoryGirl.create(:wine, name: wine_name, vintage: vintage) }

      it "should add a glass with the existing wine" do

        response = add_that_glass
        expect(response.glass).to_not eq(nil)
        expect(Wine.find(response.glass.wine_id)).to eq(wine)
        expect(response.glass.wine.name).to eq(wine_name)
        expect(response.glass.wine.vintage).to eq(vintage)

      end

    end

  end


end
