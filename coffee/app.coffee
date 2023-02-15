{ logError, isOperationalError } = require 'errorhandler'
@log=console.log
@error=console.error

@attachErrorHandler=(host)->
  process.on 'unhandledRejection',(reason,p)->
    @error reason, 'Unhandled Rejection at Promise', p
  .on 'uncaughtException',(err)->
    @error err, 'Uncaught Exception thrown'
    if !isOperationalError(err)
      process.exit 1
  .on 'error',(err)->
    @error err, 'Error'

@warpErrorHandler=(o,func,cb)->
  try
    func o,cb
  catch e
    #console.log " we caught an error!!! "
    @error e
    cb e,o