React = require 'react'
_ = require 'underscore'
Option = require './option'

OPTIONS = [
  "Difficulty"
  "Euphoria"
  "Ubiquity"
  "Profundity"
  "Absurdity"
  "Sanctimony"
  "Necessity"
]

module.exports = React.createClass
  getDefaultProps: ->
    options: _.shuffle(OPTIONS)

  getInitialState: ->
    selected: null
    complete: false

  select: (index) ->
    @setState
      selected: index
    setTimeout =>
      @props.nextStep(choice: @props.options[index])
    , 500

  render: ->
    options = @props.options.map (option, index) =>
      <Option
        text={option}
        key={index}
        index={index}
        selected={@state.selected is index}
        select={@select}
      />
    <div className="options">
      {options}
    </div>
