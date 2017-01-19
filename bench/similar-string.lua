local function bench_similar_string(str_fns)
  local ptn = '(%x+%-%d+)%\n'
  local pos, idx_j = 1, 1
  local idx_i
  local s
  local i = 0

  while true do
    i = i + 1
    local t0 = os.clock()

    idx_i, idx_j, s = string.find(str_fns, ptn, pos)
    if idx_i == nil then
      return
    end

    if i % 10240 == 0 then
      print(i .. '-th line:', s)
      local t1 = os.clock()
      print(t1-t0)
    end
    pos = idx_j + 1
  end
end


local fhandle, err = io.open( 'bench/similar-string.txt', 'r' )
local ss = fhandle:read('*a')
fhandle:close()

bench_similar_string(ss)
print('time should be less than several millisecond')
-- vim: sw=2
