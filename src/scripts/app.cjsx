# require '../../public/main.css'
React = require 'react'
require 'react/addons'
ReactCSSTransitionGroup = React.addons.CSSTransitionGroup
# Assign React to Window so the Chrome React Dev Tools will work.
window.React = React

Interactive = require './interactive'

App = React.createClass
  render: ->
    <div className="container">
      <Interactive />
    </div>


React.render <App/>, document.body
