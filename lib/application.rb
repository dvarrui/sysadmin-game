
require 'singleton'

class Application
  include Singleton

  attr_reader   :name, :version, :letter, :output_basedir
  attr_reader   :debug, :verbose
  attr_accessor :global, :tasks, :hall_of_fame
  attr_accessor :script_path, :config_path, :test_name

  def initialize
    @name = 'sysadmin-game'
    @version = '0.22.1'
    @letter = {good: '.', bad: 'F', error: '?', none: ' '}
    @output_basedir = 'var'
   	@debug = false
	  @verbose = true

    @global = {}
    @tasks = []
    @hall_of_fame = []
  end
end
