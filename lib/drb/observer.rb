require 'observer'

module DRb
  module DRbObservable
    include Observable

    def notify_observers(*arg)
      if defined? @observer_state and @observer_state
	if defined? @observer_peers
	  for i in @observer_peers.dup
	    begin
              puts "sending update"
	      i.update(*arg)
	    rescue
              p $!
	      delete_observer(i)
	    end
	  end
	end
	@observer_state = false
      end
    end
  end
end
