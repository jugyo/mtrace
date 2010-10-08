mtrace_indent = 0
set_trace_func lambda {|event, file, line, id, binding, klass|
  case event
  when 'call'
    puts "\e[90m| " * mtrace_indent +
      "\e[35m#{klass}\e[90m#\e[36m#{id} \e[90m#{file}:#{line}\e[0m" +
      "#{'  ' * ([10 - mtrace_indent, 1].max)}\e[90mtxmt://open/?url=file://#{ File.expand_path(file).sub(File.expand_path('~'), '~') }&line=#{ line }\e[0m"
    mtrace_indent += 1
  when 'return'
    mtrace_indent -= 1
  end
  mtrace_indent = 0 if mtrace_indent < 0
}
