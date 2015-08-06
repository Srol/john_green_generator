React = require 'react'
Isvg = require 'react-inlinesvg'
classnames = require 'classnames'

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

  empty: ->
    !@props.value or @props.value is ''
  render: ->
    <div>
      <div className="group">
        <div className="input-container">
          <input type="text" ref="input"
            placeholder={@props.text}
            name={@props.name}
            onChange={@handleChange}
            value={@props.value}
          />
          <button disabled={@empty()}>
            <Isvg src="arrow.svg" width="25" height="24"
              className={classnames(disabled: @empty())}
            />
          </button>
        </div>
      </div>
      {
        @props.eg? &&
        <div className="eg">(e.g., {@props.eg})</div>
      }
    </div>
