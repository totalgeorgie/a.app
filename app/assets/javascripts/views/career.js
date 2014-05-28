Atlas.Views.CareerView = Backbone.AppView.extend({
  template: JST["career/show"],
  firstFields: JST["career/first-fields"],
  
  initialize: function() {
    this.user = Atlas.user
  },
  
  events: {
    'blur .user-field' : 'alterUserInfo',
    'blur .common-app-field' : 'alterCommonAppInfo',
    'change .chosen-select' : 'alterCommonAppInfo',
    'slideStop .salary-slider' : 'alterSliderInfo',
    'slideStop .culture-slider' : 'alterSliderInfo'
  },
  
  alterSliderInfo: function(e) {
    var fieldName = $(e.target).attr('name'),
        value = e.value;

    this.user.commonApp().set(fieldName, value).save();
  },

  _addSlider: function() {
    $('.salary-slider').slider();
    $('.culture-slider').slider();
  },

  render: function() {
    var content = this.template(),
        firstFields = this.firstFields({
          user: Atlas.user
        });

    this.$el.html(content);
    this.$el.find('.first-fields').append(firstFields);

    window.setTimeout(this._addSelects.bind(this), 0);
    window.setTimeout(this._addSlider.bind(this), 0);
    
    return this;
  }

});