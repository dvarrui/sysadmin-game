# encoding: utf-8

require_relative 'debian'

start do
	show :resume
	export :format => :txt
	send :copy_to => :host1
end

=begin
---
:global:
  :host1_username: root
:cases:
- :tt_members: david
  :host1_ip: 172.19.2.30
  :host1_password: 45454545a
  :firstname: david
  :lastname1: vargas
  :lastname2: ruiz

=end
