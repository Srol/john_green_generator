React = require 'react'
Isvg = require 'react-inlinesvg'

module.exports = React.createClass
  getInitialState: ->
    foo: 'bar'

  componentDidMount: ->
    if @props.focus
      React.findDOMNode(@refs.input).focus()

  handleChange: (e) ->
    obj = {}
    obj[e.target.name] = e.target.value
    @props.handleChange(obj)

  render: ->
    <div className="group">
      <div className="input-container">
        <input type="text" ref="input"
          placeholder={@props.text}
          name={@props.name}
          onChange={@handleChange}
        />
        <div>></div>
      </div>
    </div>
