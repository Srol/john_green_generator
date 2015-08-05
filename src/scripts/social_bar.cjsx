React = require 'react'
Isvg = require 'react-inlinesvg'
Tappable = require 'react-tappable'

module.exports = React.createClass
  tweet: (e) ->
    link = "https://twitter.com/home?status=#{encodeURIComponent @props.text} #{encodeURIComponent @props.post_url}"
    window.open link
    e.preventDefault()

  fb: (e) ->
    description = encodeURIComponent @props.fb_description
    picture = encodeURIComponent @props.fb_image
    text = encodeURIComponent @props.text
    app_id = @props.app_id
    url = "https://www.facebook.com/dialog/feed?description=#{description}&picture=#{picture}&name=#{text}&link=#{encodeURIComponent @props.post_url}&app_id=#{app_id}&display=page&redirect_uri=#{encodeURIComponent @props.post_url}"
    window.open url
    e.preventDefault()

  render: ->
    <div className="social">
      <div className="start-over">
        <a href="#" onClick={@props.startOver}>Start over</a>
      </div>
      <Tappable onClick={@tweet}><a href="#"><Isvg src="tw.svg" className="button" /></a></Tappable>
      <Tappable onClick={@fb}><a href="#"><Isvg src="fb.svg" className="button" /></a></Tappable>
    </div>

