workspace "SDL3"
    platforms "x64"
    architecture "x64"
    location "build"
    
    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "SDL"
    kind "SharedLib"
    language "C++"
    staticruntime "Off"

    targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "SDL_internal.h"
	pchsource "src/SDL_internal.c"

    -- Add source files here
    files 
	{
		"include/**.h",

        "src/*.c",
        "src/*.h",

        "src/atomic/*.c",

        "src/audio/directsound/*.h",
        "src/audio/directsound/*.c",
        "src/audio/disk/*.h",
        "src/audio/disk/*.c",
        "src/audio/dummy/*.h",
        "src/audio/dummy/*.c",
        "src/audio/wasapi/*.h",
        "src/audio/wasapi/*.c",
        "src/audio/*.c",
        "src/audio/*.h",

        "src/core/windows/*.c",
        "src/core/windows/*.h",

        "src/cpuinfo/*.c",

        --"src/dynapi/*.c",
        "src/dynapi/*.h",

        "src/events/blank_cursor.h",
        "src/events/default_cursor.h",
        "src/events/scancodes_windows.h",
        "src/events/SDL_clipboardevents.c",
        "src/events/SDL_clipboardevents_c.h",
        "src/events/SDL_displayevents.c",
        "src/events/SDL_displayevents_c.h",
        "src/events/SDL_dropevents.c",
        "src/events/SDL_dropevents_c.h",
        "src/events/SDL_events.c",
        "src/events/SDL_events_c.h",
        "src/events/SDL_keyboard.c",
        "src/events/SDL_keyboard_c.h",
        "src/events/SDL_mouse.c",
        "src/events/SDL_mouse_c.h",
        "src/events/SDL_quit.c",
        "src/events/SDL_touch.c",
        "src/events/SDL_touch_c.h",
        "src/events/SDL_windowevents.c",
        "src/events/SDL_windowevents_c.h",

        "src/file/SDL_rwops.c",
        "src/filesystem/windows/SDL_sysfilesystem.c",

        "src/haptic/dummy/SDL_syshaptic.c",
        "src/haptic/windows/*.c",
        "src/haptic/windows/*.h",
        "src/haptic/*.h",
        "src/haptic/*.c",
        "src/hidapi/hidapi/hidapi.h",
        "src/hidapi/SDL_hidapi.c",

        "src/joystick/*.c",
        "src/joystick/*.h",
        "src/joystick/dummy/*.c",
        "src/joystick/hidapi/*.c",
        "src/joystick/hidapi/*.h",
        "src/joystick/dummy/*.h",
        "src/joystick/virtual/*.h",
        "src/joystick/virtual/*.c",
        "src/joystick/windows/*.c",
        "src/joystick/windows/*.h",

        "src/libm/*.c",
        "src/libm/*.h",
        "src/loadso/windows/*.c",

        "src/locale/*.c",
        "src/locale/*.h",
        "src/locale/windows/*.c",

        "src/misc/windows/*.c",
        "src/misc/SDL_sysurl.h",
        "src/misc/SDL_url.h",

        "src/power/windows/*.c",
        "src/power/SDL_power.c",
        "src/power/SDL_syspower.h",

        "src/render/*.c",
        "src/render/*.h",
        "src/render/direct3d/*.c",
        "src/render/direct3d/*.h",
        "src/render/direct3d11/SDL_render_d3d11.c",
        "src/render/direct3d11/SDL_shaders_d3d11.c",
        "src/render/direct3d11/SDL_shaders_d3d11.h",
        "src/render/direct3d12/SDL_render_d3d12.c",
        "src/render/direct3d12/SDL_shaders_d3d12.c",
        "src/render/direct3d12/SDL_shaders_d3d12.h",
        "src/render/opengl/*.c",
        "src/render/opengl/*.h",
        "src/render/opengles2/*.c",
        "src/render/opengles2/*.h",
        "src/render/software/*.c",
        "src/render/software/*.h",

        "src/sensor/*.c",
        "src/sensor/*.h",
        "src/sensor/dummy/*.c",
        "src/sensor/dummy/*.h",
        "src/sensor/windows/*.c",
        "src/sensor/windows/*.h",

        "src/stdlib/*.c",
        "src/stdlib/*.h",

        "src/thread/*.h",
        "src/thread/*.c",
        "src/thread/generic/SDL_syscond_c.h",
        "src/thread/generic/SDL_syscond.c",
        "src/thread/windows/*.c",
        "src/thread/windows/*.h",
        "src/thread/generic/SDL_sysrwlock.c",
        "src/thread/generic/SDL_sysrwlock_c.h",

        "src/timer/windows/*.c",
        "src/timer/windows/*.h",
        "src/timer/*.c",
        "src/timer/*.h",

        "src/video/dummy/*.c",
        "src/video/dummy/*.h",
        "src/video/khronos/vulkan/*.h",
        "src/video/khronos/windows/*.h",
        "src/video/khronos/windows/*.c",
        "src/video/yuv2rgb/yuv_rgb_sse_func.h",
        "src/video/yuv2rgb/yuv_rgb_std_func.h",
        "src/video/yuv2rgb/yuv_rgb.c",
        "src/video/yuv2rgb/yuv_rgb.h",
        "src/video/*.c",
        "src/video/*.h",
        "src/video/windows/*.c",
        "src/video/windows/*.h",


    }

    removefiles("src/audio/SDL_audio_channel_converters.h")
    removefiles("src/audio/SDL_audio_resampler_filter.h")
    removefiles("src/hidapi/controller_list.h")
    removefiles("src/joystick/hidapi/SDL_hidapi_nintendo.h")

    -- Include directories
    includedirs 
	{
        "include","src"
    }

    -- Configuration-specific settings
    filter { "configurations:Debug" }
        defines { "_DEBUG", "DLL_EXPORT"}
        symbols "On"
        runtime "Debug"

    filter { "configurations:Release" }
        defines { "NDEBUG", "DLL_EXPORT" }
        optimize "On"
        runtime "Release"

    filter { "platforms:x64" }
        architecture "x86_64"

    -- Additional dependencies
    links {
        "setupapi.lib",
        "winmm.lib",
        "imm32.lib",
        "version.lib",
        "vcruntime.lib",
        "libucrt.lib"
    }

    -- Windows-specific settings
    filter { "system:windows" }
        characterset "Unicode"
        systemversion "latest"
        defines { "_WINDOWS"}
