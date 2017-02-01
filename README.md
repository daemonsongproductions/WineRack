# README

Things to track:

- Winery
- Name of the wine
- Vintage
- Rating
- Notes


DATA MODEL:

- Wines:
  - id
  - winemaker_id
  - name
  - vintage
  - style
  - rating
  - notes
  
- Winemakers:
  - id
  - region
  - notes
  
- Drinks:
  - id
  - wine_id
  - date
  - user_id

- Bottles:
  - id
  - wine_id
  - date_acquired
  - date_opened
  - user_id