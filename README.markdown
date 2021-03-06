I18nControllerNamespaces
========================

This plugin extends the I18n translations in controllers to behave the 
same way as views. This means, that each translation call beginning 
with a dot '.' will be prefixed with a namespace. This automatic scoping 
takes into account the modules, class name, and method name. So a call in 
Admin::UsersController.index will be prefixed with 'admin.users.index'.

This plugin **only** works with calls to t() and translate() within 
controllers which inherit from ActionController::Base. Calls to 
I18n.t() and I18n.translate() are not touched and keys will not be 
prefixed.

*Note:* This plugin has only been tested with rails3 and has a very 
limited test coverage. So please run your test suite before using it in 
production. I hope I will find time to extend it. Or just fork and add 
it yourself. 

Example
-------

class UserController < ApplicationController
  
  # POST: /users
  def create
    # your app logic
    redirect_to :index, :notice => t('.success')
  end
  
end

After creating a new user, this controller would redirect you to the 
users index and would show a flash notice message with the key

users.create.success

---

Copyright (c) 2010 Maximilian Schulz (kulturfluss.de) released under the 
MIT license