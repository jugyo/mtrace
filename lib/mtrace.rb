mtrace_indent = 0
set_trace_func lambda {|event, file, line, id, binding, klass|
  case event
  when 'call'
    puts "\e[90m| " * mtrace_indent + "\e[35m#{klass}\e[90m#\e[36m#{id} \e[90m#{file}:#{line}\e[0m"
    mtrace_indent += 1
  when 'return'
    mtrace_indent -= 1
  end
  mtrace_indent = 0 if mtrace_indent < 0
}
