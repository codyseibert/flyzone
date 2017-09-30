walk = require 'walk'
fs = require 'fs'
path = require 'path'
require 'coffeescript/register'

walker = walk.walk './data'

data = {}

promise = new Promise (resolve, reject) ->
  walker.on 'file', (root, stats, next) ->
    filePath = path.join root, stats.name
    baseName = path.basename stats.name, '.coffee'
    parts = filePath.split(path.sep)
    folder = parts[parts.length - 2]
    data[folder] ?= {}
    entry = require path.resolve filePath
    entry.id = baseName
    data[folder][baseName] = entry
    next()

  walker.on 'errors', (root, nodeStatsArray, next) ->
    next()

  walker.on 'end', ->
    resolve data

module.exports = promise