React = require 'react'
Choices = require './choices'
Form = require './form'
MoneyShot = require './money_shot'

module.exports = React.createClass
  getInitialState: ->
    step: 0

  nextStep: (obj={}) ->
    obj.step = @state.step + 1
    @setState obj, =>
      console.log @state

  render: ->
    step = switch @state.step
      when 0
        <div>
          <h3 className="header">Choose one:</h3>
          <Choices nextStep={@nextStep} />
        </div>
      when 1
        <Form nextStep={@nextStep} />
      when 2
        <MoneyShot
          PERSONAL_HERO={@state.hero}
          LEAST_FAVORITE_US_CITY={@state.city}
          NEMESIS={@state.nemesis}
          LANDFORM={@state.landform}
          CHOICE={@state.choice}
        />
    <div>
      <h3 className="interactive">The John Green Plot Generator</h3>
      {step}
    </div>
