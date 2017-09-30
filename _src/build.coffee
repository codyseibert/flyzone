walk = require 'walk'
fs = require 'fs'
path = require 'path'

# walker = walk.walk './layouts'
#
# walker.on 'file', (root, stats, next) ->
#   fs.readFile path.join(root, stats.name), 'utf-8', (err, content) ->
#     console.log content
#     next()
#
# walker.on 'errors', (root, nodeStatsArray, next) ->
#   next()
#
# walker.on 'end', ->
#   console.log 'all done'

require './loadData'
  .then (data) ->
    console.log 'data', JSON.stringify data, null, 2
    require './loadSass'
  .then (css) ->
    console.log css

###
- load all data
- for each page, load aload in the layout,

###