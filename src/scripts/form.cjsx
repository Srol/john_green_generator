React = require 'react'
Input = require './input'
Tappable = require 'react-tappable'

module.exports = React.createClass
  getInitialState: ->
    # hero: "John Appel"
    # landform: "Mountains"
    # city: "Des Moines"
    # nemesis: "Chad Plumb"
    hero: null
    landform: null
    city: null
    nemesis: null
    filled: false
    step: 0

  componentDidMount: ->
    @props.resize()

  handleChange: (inputObj) ->
    @setState inputObj

  nextStep: ->
    @setState step: @state.step + 1

  handleSubmit: (e) ->
    e.preventDefault()
    e.stopPropagation()
    if @state.step is 3
      @props.nextStep(@state)
    else
      @nextStep()

  render: ->
    <div className="form">
      <form onSubmit={@handleSubmit}>
      {
        switch @state.step
          when 0
            <Input
              text="Your personal hero"
              focus={true}
              handleChange={@handleChange}
              name="hero"
              value={@state.hero}
            />
          when 1
            <Input
              text="A plural geographic landform"
              eg="mountains, caves, deciduous forests"
              handleChange={@handleChange}
              name="landform"
              value={@state.landform}
            />
          when 2
            <Input
              text="Your least favorite U.S. city"
              handleChange={@handleChange}
              name="city"
              value={@state.city}
            />
          when 3
            <Input
              text="Your childhood nemesis"
              handleChange={@handleChange}
              name="nemesis"
              value={@state.nemesis}
            />
      }
      </form>
    </div>
