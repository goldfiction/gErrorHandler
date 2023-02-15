{ logError, isOperationalError } = require 'errorhandler'

@attachErrorHandler=(host)->
  process.on 'unhandledRejection',(reason,p)->
    console.error reason, 'Unhandled Rejection at Promise', p
  .on 'uncaughtException',(err)->
    console.error err, 'Uncaught Exception thrown'
    if !isOperationalError(err)
      process.exit 1
  .on 'error',(err)->
    console.error err, 'Error'

@warpErrorHandler=(o,func,cb)->
  try
    func o,cb
  catch e
    #console.log " we caught an error!!! "
    console.error e
    cb e,o

@log=console.log
@error=console.error
