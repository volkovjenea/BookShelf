#
#=require action_cable
#=require_self
#=reuqire_tree ./channels
#

@App ||=  {}
App.cable = ActionCable.createConsumer()  