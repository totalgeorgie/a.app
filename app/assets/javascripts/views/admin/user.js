AtlasUser.Views.UserShow = Backbone.AppView.extend({
  template: JST['admin/users/show'],
  _header: JST['admin/users/_header'],
  _short_answers: JST['admin/users/_short_answers'],
  _deeper_answers: JST['admin/users/_common-app-deeper'],
  _apps: JST['admin/users/_apps-and-potentials'],

  initialize: function() {
    this.user = AtlasUser.user;
  },

  events: {
    'blur .user-info-field' : 'alterUserInfo',
  },
  
  render: function() {
    var content = this.template({ user: AtlasUser.user }),
        _header = this._header({ user: AtlasUser.user }),
        _short_answers = this._short_answers({ user: AtlasUser.user }),
        _deeper_answers = this._deeper_answers({ user: AtlasUser.user }),
        _apps = this._apps({ user: AtlasUser.user });

    this.$el.html(content);
    this.$el.find('.admin-profile-header').append(_header);
    this.$el.find('.admin-profile-answer').append(_short_answers);
    this.$el.find('.admin-common-app-deeper').append(_deeper_answers);
    this.$el.find('.admin-view-user-applications').append(_apps);
    window.setTimeout(CameraTag.setup, 0)
    
    return this;
  }

});