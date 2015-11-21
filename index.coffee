fs = require 'fs'

module.exports =
  name: 'package.json'
  read_type: 'file'
  filters: (app) ->
    [
      {name: 'JSON', extensions: ['json']}
      {name: 'All files', extensions: ['*']}
    ]
  load: (app) ->
    app.editor().setValue(JSON.parse fs.readFileSync app.target(), encoding: 'utf8')
  save: (app) ->
    fs.writeFileSync app.target(), JSON.stringify app.editor().getValue(), null, '  '
  schema: (app) -> require './package.json.schema.json'
