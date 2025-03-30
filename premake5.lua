project "GLFW"
   kind "StaticLib"
   language "C"

   targetdir ("bin/" .. outputDir .. "/%{prj.name}")
   objdir ("bin-int/" .. outputDir .. "/%{prj.name}")

   files {
      "include/GLFW/glfw3.h",
      "include/GLFW/glfw3native.h",
      "src/*.c"
   }

   includedirs { "include" }

   filter "system:windows"
      defines { "_GLFW_WIN32" }
      files {
         "src/win32_*.*",
         "src/wgl_context.c",
         "src/egl_context.c",
         "src/osmesa_context.c"
      }

   filter "configurations:Debug"
      staticruntime "On"
      optimize "on"

   filter "configurations:Release"
      staticruntime "On"
      symbols "on"
