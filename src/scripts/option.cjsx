React = require 'react'
classnames = require 'classnames'
Tappable = require 'react-tappable'

module.exports = React.createClass
  getInitialState: ->
    selected: false

  handleClick: (e) ->
    @props.select(@props.index)

  render: ->
    <Tappable
      className={classnames('option', selected: @props.selected)}
      onTap={@handleClick}
      moveThreshold={10}
    >
      {@props.text}
    </Tappable>
