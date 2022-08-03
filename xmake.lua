--Config:
local packages = {
	"lua",
	"curl"
}

local sanitizers = { "address", "leak", "undefined" }

local cflags = {
    release = {},
    debug = {
        "-Wno-unused-function", "-Wno-unused-parameter", "-Wno-unused-variable"
    },
    regular = {
        "-Wall", "-Wextra", "-Werror",
    }
}

local ldflags = {
    release = {},
    debug = {},
    regular = {}
}

set_languages {
    "gnulatest"
}

add_rules("mode.debug", "mode.release")

add_requires(packages)

target("Downloader")
do
    set_kind("shared")
    add_packages(packages)

    add_files("src/**.c")

    add_includedirs("src/")

    add_cflags(cflags.regular)
    add_ldflags(ldflags.regular)

    if is_mode("debug") then
        add_cflags(cflags.debug)
        add_ldflags(ldflags.debug)

        for _, v in ipairs(sanitizers) do
            add_cxflags("-fsanitize=" .. v)
            add_ldflags("-fsanitize=" .. v)
        end

        add_defines("PROJECT_DEBUG")
    elseif is_mode("release") then
        add_cflags(cflags.release)
        add_ldflags(ldflags.release)
    end
end
target_end()

