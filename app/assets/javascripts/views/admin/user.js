AtlasUser.Views.UserShow = Backbone.AppView.extend({
  template: JST['admin/users/show'],
  _header: JST['admin/users/_header'],
  _short_answers: JST['admin/users/_short_answers'],

  initialize: function() {
    window.setTimeout(CameraTag.setup, 0)
  },

  events: {
    'blur .common-app-field' : 'alterCommonAppByAdmin',
  },

  alterCommonAppByAdmin: function(e) {
    var $input = $(e.target),
        attr = $input.attr('name'),
        value = $input.val();
    AtlasUser.user.commonApp().set(attr, value).save();

    this.fadeCheckmark($input);
  },
  
  render: function() {
    var content = this.template({ user: AtlasUser.user }),
        _header = this._header({ user: AtlasUser.user }),
        _short_answers = this._short_answers({ user: AtlasUser.user });

    this.$el.html(content);
    this.$el.find('.admin-profile-header').append(_header);
    this.$el.find('.admin-profile-answer').append(_short_answers);
    return this;
  }

});