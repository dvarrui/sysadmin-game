
task "Windows puppet actions" do
  filename = 'C:\warning.txt'
  target "Check file <#{filename}>"
  goto   :client2, :exec => 'dir c:\\'
  expect result.find!(filename).count!.eq 1
end
