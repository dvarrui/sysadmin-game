# Laboratory
# * target
# * request (development)
# * tempfile
# * goto
# * run
# * expect
# * get
# * unique
# * log
# * set
class Laboratory
  def readme(_text)
    # Usefull for "teuton readme" command action.
  end

  def target(desc, args = {})
    @stats[:targets] += 1
    @targetid += 1
    weight = args[:weight] || 1.0
    verboseln '(%03d' % @targetid + ") target      #{desc}"
    verboseln "      weight      #{weight}"
  end
  alias goal target

#  def request(text)
#    @requests << text.to_s
#  end

  def tempfile(_tempfile = nil)
    'tempfile'
  end

  def run(command, args = {})
    args[:exec] = command
    host = :localhost
    host = args[:on] if args[:on]
    goto(host, args)
  end

  def goto(host = :localhost, args = {})
    result.reset
    args[:on] = host unless args[:on]

    if @hosts[host]
      @hosts[host] += 1
    else
      @hosts[host] = 1
    end
    verboseln "      run         '#{args[:exec]}' on #{args[:on]}"
  end

  def expect(_cond, args = {})
    verboseln "      alter       #{result.alterations}" unless result.alterations.empty?
    verboseln "      expect      #{_cond} (#{_cond.class})"
    verboseln ''
  end

  def expect_one(_cond, args = {})
    verboseln "      alter       #{result.alterations}" unless result.alterations.empty?
    verboseln "      expect_one  #{_cond} (#{_cond.class})"
    verboseln ''
  end

  def expect_none(_cond, args = {})
    verboseln "      alter       #{result.alterations}" unless result.alterations.empty?
    verboseln "      expect_none #{_cond} (#{_cond.class})"
    verboseln ''
  end

  def get(varname)
    @stats[:gets] += 1

    if @gets[varname]
      @gets[varname] += 1
    else
      @gets[varname] = 1
    end

    "get(#{varname})"
  end

  # If a method call is missing, then delegate to concept parent.
  def method_missing(method)
    a = method.to_s
    instance_eval("get(:#{a[0, a.size - 1]})") if a[a.size - 1] == '?'
  end

  def gett(option)
    value = get(option)
    value
  end

  def unique(key, _value)
    @stats[:uniques] += 1

    verboseln "    ! Unique      value for <#{key}>"
    verboseln ''
  end

  def log(text = '', type = :info)
    @stats[:logs] += 1
    verboseln "      log    [#{type}]: " + text.to_s
  end

  def set(key, value)
    @stats[:sets] += 1

    key = ':' + key.to_s if key.class == Symbol
    value = ':' + value.to_s if value.class == Symbol

    @sets[key] = value
    "set(#{key},#{value})"
  end
end