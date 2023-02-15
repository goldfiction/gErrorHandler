var assert=require("assert")
var app=require("./../main.js")

var host=this;

async function test(done){
  app=await app
  app.attachErrorHandler.apply(this,null)
  throw(new Error("got this error?"))
  done()
}

test(function(e,r){
  
})