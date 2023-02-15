/*global coffee*/
var gqcoffee=require("gqcoffee");
var app=gqcoffee
    .q_load()
    .then(function(){
      return gqcoffee.requireFromString(coffee["coffee/app"]);
    });
module.exports=app;
