local options = {
  encoding="utf-8",
  synmaxcol=200,
  hlsearch=false,
  hidden=true,
  wildmenu=true,
  -- wildmode=
  showcmd=true,
  ignorecase=true,
  smartcase=true,
  autoindent=true,
  startofline=false,
  ruler=true,
  visualbell=true,
  number=true,
  wrap=false,
  conceallevel=0,
  list=true,
  spell=true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
