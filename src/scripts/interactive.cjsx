React = require 'react'
Choices = require './choices'
Form = require './form'
MoneyShot = require './money_shot'
Resizer = require './kinja_resizer'

module.exports = Interactive = React.createClass
  mixins: [Resizer]
  getInitialState: ->
    step: 0

  nextStep: (obj={}) ->
    obj.step = @state.step + 1
    @setState obj

  reset: ->
    @replaceState(@getInitialState())

  render: ->
    step = switch @state.step
      when 0
        <div>
          <h3 className="header">Choose one:</h3>
          <Choices nextStep={@nextStep} />
        </div>
      when 1
        <Form nextStep={@nextStep}
          resize={@resize}
        />
      when 2
        <MoneyShot
          PERSONAL_HERO={@state.hero}
          LEAST_FAVORITE_US_CITY={@state.city}
          NEMESIS={@state.nemesis}
          LANDFORM={@state.landform}
          CHOICE={@state.choice}
          resize={@resize}
          startOver={@reset}
          }
        />
    <div>
    { @state.step < 2 &&
      <h3 className="interactive">The John Green Plot Generator</h3>
    }
      {step}
    </div>
