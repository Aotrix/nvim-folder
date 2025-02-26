-- use :!cmake --build PATH_TO_BUILD_FOLDER
-- && Telescope to choose executable in PATH_TO_BUILD_FOLDER/EXECUTABLE_FOLDER/*
-- Find these lines (in cmake.build) : agougou is the "bin" folder, program is the exe name
-- CMakeFiles/program.dir/build: agougou/program
-- rg 'CMakeFiles\/(.*).dir\/build:(?!.*Lib*)' build/CMakeFiles/ --no-filename -Por '$1'
vim.keymap.set("n", "mt",
               "<CMD>terminal cmake --build build && ./build/bin/* <CR>",
               {noremap = true, silent = true})
