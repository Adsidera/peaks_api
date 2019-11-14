# PEAKS Rest API
There is a `Series` and `Datum` model objects.
A `Series` has many `Data`.
The initial `Series` and `Data` are seeded and persisted in a `postgresql` database, from extracting the sample data from the original excel file (which I converted in a CSV one).

A `SignalCreator` service gets initialized with a `threshold` and `sensitivity` parameters.

I added the `sensitivity` parameter as a percentage, as to decide from which percentage less the `threshold` to start detecting the exceeding `data`.

 The `SignalCreator` method `send_signal`is responsible for the analysis of the `data` and the output of the signal in 0 or 1.

The `Datum` model then uses `send_signal` to output the result in its `output signal` instance method.

The endpoint `GET /api/v1/series` is the endpoint responsible for retrieving series, analyzing their data and assessing which of them has exceeded a specified threshold.

The `Series` collection is serialized, so that it includes `Data` as `data_values` and the signal of each `data` in a series as `signals`.

I have added `ams_lazy_relationships` to avoid N+1 queries in the serializer (`ActiveModelSerializer`).

The `Series` is returned only if  `threshold` and `sensitivity` parameters are included in the request.

[You can check here in Postman](https://documenter.getpostman.com/view/338194/SW7UdBgg) how I serialized the `Series` collection to include `Data`.

If you use the Postman app, you can also visualize the data in the Postman Visualizer.




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
