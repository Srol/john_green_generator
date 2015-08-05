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

  handleChange: (inputObj) ->
    @setState inputObj, ->
      if @allFilled()
        @setState filled: true
      else
        @setState(filled: false) if @state.filled

  allFilled: ->
    @filled(@state.hero) and @filled(@state.landform) and
      @filled(@state.city) and @filled(@state.nemesis)

  filled: (val) ->
    val? and val != ''

  handleTap: (e) ->
    e.preventDefault()
    setTimeout =>
      @props.nextStep(@state)
    , 500

  render: ->
    <div className="form">
      <form onSubmit={@handleTap}>
        <Input
          text="Your personal hero"
          focus={true}
          handleChange={@handleChange}
          name="hero"
        />
        <Input
          text="A plural geographic landform"
          eg="mountains, caves, deciduous forests"
          handleChange={@handleChange}
          name="landform"
        />
        <Input
          text="Your least favorite U.S. city"
          handleChange={@handleChange}
          name="city"
        />
        <Input
          text="Your childhood nemesis"
          handleChange={@handleChange}
          name="nemesis"
        />
        {
          @state.filled and
          <Tappable onTap={@handleTap}>
            <button>Done</button>
          </Tappable>
        }
      </form>
    </div>
