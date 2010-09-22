module Paperclip
  module CallbackCompatability
    # module Rails21
    #   def self.included(base)
    #     base.extend(Defining)
    #     base.send(:include, Running)
    #   end
    # 
    #   module Defining
    #     def define_paperclip_callbacks(*args)
    #       args.each do |callback|
    #         define_callbacks("before_#{callback}")
    #         define_callbacks("after_#{callback}")
    #       end
    #     end
    #   end
    # 
    #   module Running
    #     def run_paperclip_callbacks(callback, opts = nil, &blk)
    #       # The overall structure of this isn't ideal since after callbacks run even if
    #       # befores return false. But this is how rails 3's callbacks work, unfortunately.
    #       if run_callbacks(:"before_#{callback}"){ |result, object| result == false } != false
    #         blk.call
    #       end
    #       run_callbacks(:"after_#{callback}"){ |result, object| result == false }
    #     end
    #   end
    # end

    module Rails3
      # def self.included(base)
      #   base.extend(Defining)
      #   base.send(:include, Running)
      # end
      # 
      # module Defining
      # 
      #   # taken from rails tip code, August 2010
      #   def define_callbacks(klass)
      #     existing_methods = klass.instance_methods.map { |m| m.to_sym }
      #     observer = self
      #     observer_name = observer.class.name.underscore.gsub('/', '__')
      # 
      #     self.class.observed_methods.each do |method|
      #       callback = :"_notify_#{observer_name}_for_#{method}"
      #       unless existing_methods.include? callback
      #         klass.send(:define_method, callback) do  # def _notify_user_observer_for_before_save
      #           observer.update(method, self)          #   observer.update(:before_save, self)
      #         end                                      # end
      #         klass.send(method, callback)             # before_save :_notify_user_observer_for_before_save
      #       end
      #     end
      #   end
      # 
      #   def define_paperclip_callbacks(*callbacks)
      #     define_callbacks *[callbacks, {:terminator => "result == false"}].flatten
      #     callbacks.each do |callback|
      #       eval <<-end_callbacks
      #         def before_#{callback}(*args, &blk)
      #           set_callback(:#{callback}, :before, *args, &blk)
      #         end
      #         def after_#{callback}(*args, &blk)
      #           set_callback(:#{callback}, :after, *args, &blk)
      #         end
      #       end_callbacks
      #     end
      #   end
      # end
      # 
      # module Running
      #   def run_paperclip_callbacks(callback, opts = nil, &block)
      #     run_callbacks(callback, opts, &block)
      #   end
      # end

    end

  end
end
