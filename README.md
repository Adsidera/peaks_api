# PEAKS Rest API

- [x] Customize Gemfile with: `fabrication`, `faker`, `pry`, `awesome_print`, `rspec`, `shoulda_matchers`, `rubocop`, `rack-cors`, `pg`, `active_model_serializer`
- [x] Create database table data with "value" as float attribute
- [x] Change schema format to :sql
- [x] Create model Datum
- [x] Create service SignalCreator for analysing and calculating related signal
- [x] create fabricator for Datum and Series model
- [x] create Series model
- [x] seed data
- [x] added `active_model_serializer`
- [x] create controller for series
- [x] create routes - root to series#index
- [x] define series#index json response with serialized data and related signals
- [x] added `ams_lazy_relationships` to avoid N+1 queries in serializer
- [x] added conditional assignment of data according to the presence of start and end day params
- [x] unit specs for Datum model
- [x] unit spec for SignalCreator
- [x] unit spec for SeriesSerializer
- [x] request spec
- [x] Check json responses via Postman
- [x] Created tests for Postman
- [x] Created simple visualization in Postman
- [x] Deploy to heroku as production
