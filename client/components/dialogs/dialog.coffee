Template.dialog.created = ->
  instance = @
  console.log("dialog opened with data", instance.data)


Template.dialog.events

  'click [data-close]': ( e ) ->

    globalLayout.closeDialog()

  'click [data-action-delete]': ( e ) ->

    self = this
    tempList = Session.get( 'list' )
    tempList = _.reject tempList, ( val ) ->
      if val.id is self.id
        return val
    Session.set( 'list', tempList )

