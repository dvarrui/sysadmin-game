
group "Preserve output reports" do

  target "Create user david"
  run "id david"
  expect "david"

end

play do
  show
  export preserve: true
end
