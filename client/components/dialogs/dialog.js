Template.dialog.created = function() {
  var instance;
  instance = this;
  console.log("dialog opened with data", instance.data);
  return console.log("json data from session", Session.get('dialog.ui.dialogJSONDate'));
};

Template.dialog.events({
  'click [data-close]': function(e) {
    return globalLayout.closeDialog();
  },
  'click [data-action-delete]': function(e) {
    var self, tempList;
    self = this;
    tempList = Session.get('list');
    tempList = _.reject(tempList, function(val) {
      if (val.id === self.id) {
        return val;
      }
    });
    return Session.set('list', tempList);
  }
});
