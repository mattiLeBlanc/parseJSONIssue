Template.testComponent.created = ->
  instance = this



Template.testComponent.helpers

  dataContext: ->
    instance = Template.instance()
    return JSON.stringify( instance.data )