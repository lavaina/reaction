_ = require("underscore")
expect = require("chai").expect
webdriverjs = require("webdriverjs")
check = require("./check")

describe("Login test suite", ->
  beforeEach (done) ->
    @client
      .url("http://localhost:3000/")
      .waitFor(".all-subscriptions-ready", 3000)
      .call(done)

  it "Login test", (done) ->
    @client
      .buttonClick(".navbar-toggle")
      .click("*=Sign In")
      .setValue("#login-email", "admin1@ongoworks.com")
      .setValue("#login-password", "ongo1")
      .buttonClick("#login-buttons-password")
      .click("*=Admin User1")
      .buttonClick("#login-buttons-logout")
      .buttonClick(".navbar-toggle")
      .element("*=Sign In", check())
      .call(done)
)
