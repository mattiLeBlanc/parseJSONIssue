# Dialog Class
class @globalLayout

  @showDialog: (opts) ->
    console.log(opts)
    @dialog = $("[global-dialog]")


    Session.set "global.ui.dialogData", opts.data
    Session.set "global.ui.dialogTemplate", opts.template

    Tracker.afterFlush =>

      @dialog.show()

  @closeDialog: ->
    Session.set "global.ui.dialogTemplate", null
    @dialog.hide()
# End Dialog Class



Template.global.created = ->

  # create or list to display
  Session.set( 'list',  [
      id: Random.id()
      name: 'Listitem 1'
    ,
      id: Random.id()
      name: 'Listitem 2'
    ,
      id: Random.id()
      name: 'Listitem 3'
  ])



Template.global.events

  "click [data-open-dialog]": (e) ->

    node = $ e.currentTarget

    globalLayout.showDialog
      data: node.data("useContext")
      template: node.data("open-dialog")
      #json only
      jsonOnly: node[0].getAttribute('data-use-context')



Template.global.helpers

  listItems: ->
    Session.get( 'list' )

Template.registerHelper 'globalDialogTemplate', ->
  Session.get "global.ui.dialogTemplate"

Template.registerHelper 'globalDialogData', ->
  Session.get "global.ui.dialogData"
