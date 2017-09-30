walk = require 'walk'
fs = require 'fs'
path = require 'path'
sass = require 'node-sass'

walker = walk.walk '.', filters: ['node_modules']

css = ''

promise = new Promise (resolve, reject) ->
  walker.on 'file', (root, stats, next) ->
    ext = path.extname stats.name
    filePath = path.join root, stats.name
    if ext is '.sass'
      sass.render file: filePath, (err, result) ->
        css += result.css.toString()
        next()
    else
      next()

  walker.on 'errors', (root, nodeStatsArray, next) ->
    next()

  walker.on 'end', ->
    resolve css

module.exports = promise