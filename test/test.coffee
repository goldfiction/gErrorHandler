assert=require "assert"
app=require "./../main.js"

host=this

before (done)->
  app=await app
  done()

describe "should be able to ",()->
  it "initialize",(done)->
    #console.log app
    assert app!=null
    assert app!=undefined
    done()
  
  it "attachErrorHandler",(done)->
    app.attachErrorHandler(host)
    done()
    
  it "throw error",(done)->
    app.attachErrorHandler(host)
    EventEmitter=require 'events'
    myEmitter = new EventEmitter()
    myEmitter.once 'event',(event,listener)->
      #console.log event,listener
      #unknownmethod()
      done()
    myEmitter.emit 'event'
    
  it "warp error function",(done)->
    o={abc:123}
    app.warpErrorHandler o,(o,cb)->
      assert o.abc==123
      #throw new Error("ddd")
      cb()
    ,done
