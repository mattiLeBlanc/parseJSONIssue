Template.testComponent.created = function() {
  var instance;
  return instance = this;
};

Template.testComponent.helpers({
  dataContext: function() {
    var instance;
    instance = Template.instance();
    return JSON.stringify(instance.data);
  }
});
