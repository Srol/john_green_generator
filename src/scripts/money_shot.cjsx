React = require 'react'
Data = require './data'
SocialBar = require './social_bar'
Isvg = require 'react-inlinesvg'
_ = require 'underscore'

colors = [
  "#D3A475"
  "#04BC62"
  "#5EACFC"
  "#FF7177"
]

module.exports = React.createClass
  getInitialState: ->
    story: @generateStory()
  getDefaultProps: ->
    storyTemplate: """
      LAME_BOY_NAME is a senior at PERSONAL_HERO High School in FAKE_SEEMING_SUBURB_NAME, a few miles outside of LEAST_FAVORITE_US_CITY. LAME_BOY_NAME is a great student. His favorite subject is MATH_ENGLISH_OR_SCIENCE_COURSE, but his true passion is DUMB_AS_HELL_TRUE_PASSION. DUMB_NICKNAME and NEMESIS never know what he’s talking about, but the three of them are best friends anyway, and have been ever since LAME_BOY_NAME moved to FAKE_SEEMING_SUBURB_NAME after VAGUE_FAMILY_TRAGEDY. After his long-time girlfriend BORING_FEMALE_NAME breaks up with him, LAME_BOY_NAME becomes infatuated by QUIRKY_FEMALE_NAME, the BLONDE_OR_BRUNETTE with a tattoo of a SYMBOL on her WRIST_ANKLE_OR_NECK. But even though she seems like the perfect girl, she’s actually SURPRISING_BUT_NON_THREATENING_CHARACTER_REVELATION. Despite their differences, they fall in love and spend the summer together. But one week before they go off to college, tragedy strikes. QUIRKY_FEMALE_NAMETRAUMATIC_EVENT, and their relationship may never be the same.
    """

  changeStory: ->
    @setState story: @generateStory(), =>
      @props.resize()

  titleCase: (string) ->
    string.split(" ").reduce (acc, val) ->
      acc += "#{val.slice(0, 1).toUpperCase()}#{val.slice(1)} "
    , ''

  generateTitleText: ->
    "The CHOICE of LANDFORM"
      .replace("CHOICE", @props.CHOICE)
      .replace("LANDFORM", @titleCase(@props.LANDFORM))

  generateTitle: ->
    title = @generateTitleText()
    title = title.split(" of ")
    <h2>{title[0]} <br /><span className="of">of</span> {title[1]}</h2>

  generateStory: ->
    data = _.clone Data
    data.push(PERSONAL_HERO: [@props.PERSONAL_HERO])
    data.push(NEMESIS: [@props.NEMESIS])
    data.push(LEAST_FAVORITE_US_CITY: [@props.LEAST_FAVORITE_US_CITY])
    story = data.reduce (story, val) =>
      key = Object.keys(val)[0]
      re = new RegExp(key, 'g')
      story = story.replace(re, _.sample(val[key]))
      story
    , @props.storyTemplate

  render: ->
    dropcap = @state.story.slice(0,1).toLowerCase()
    story = @state.story.slice(1)
    <div>
      <div className="book" style={background: _.sample(colors)}>
        <Isvg src="best_selling_author.svg" className="best" onLoad={@props.resize} />
        {@generateTitle()}
        <div className="bottom">
          <Isvg src="gold_seal.svg" className="gold" />
          <Isvg src="major_motion_picture.svg" className="movie" />
          <Isvg src="price.svg" className="price" />
        </div>
        <p>
          <img src="#{dropcap}.svg" className="dropcap" />
          {story}
        </p>
      </div>
      <SocialBar
        startOver={@changeStory}
        tw_text={"#{@generateTitleText().trim()}, a new novel by John Green and also me"}
        text={"<i>#{@generateTitleText().trim()}</i>, a new novel by John Green"}
        fb_description={"Eat your heart out, #{@props.NEMESIS}."}
        fb_image="http://johngreen.surge.sh/jg_stamp.png"
        post_url="http://jezebel.com/create-your-very-own-ya-novel-with-this-john-green-book-1722525727"
        app_id="281755378661433"
      />
    </div>
