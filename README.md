# PEAKS Rest API

- [x] Customize Gemfile with: `fabrication`, `faker`, `pry`, `awesome_print`, `rspec`, `shoulda_matchers`, `rubocop`, `rack-cors`, `pg`
- [x] Create database table data with "value" as float attribute
- [x] Change schema format to :sql
- [x] Create model Datum
- [x] Create service SignalCreator for analysing and calculating related signal
- [x] create fabricator for Datum model
- [x] seed data
- [x] create controller for data
- [x] create routes - root to data#index
- [x] define data#index json response with data and related signals via SignalCreator
- [x] added conditional assignment of data according to the presence of start and end day params
- [x] unit specs for Datum model
- [x] unit spec for SignalCreator
- [x] unit spec for DataController
- [ ] request spec
- [x] Check json responses via Postman
- [x] Created tests for Postman
- [x] Created simple visualization in Postman
