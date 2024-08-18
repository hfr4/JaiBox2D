#import "Bindings_Generator";
#import "Basic";
#import "File";
#import "String";
#import "BuildCpp";
#import "File_Utilities";

#run {
    using opts: Generate_Bindings_Options;
    array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);

    array_add(*libpaths, ".");
    array_add(*libnames, "bin/box2d_windows_amd64_avx2");
    files := file_list(tprint("%box2d-3.0.0/include", #filepath), true);
    for file: files {
        print("%\n", file);
        array_add(*source_files, file);
    }

    array_add(*extra_clang_arguments, "-x", "c++");
    generate_compile_time_struct_checks = false;

    array_add(*system_include_paths, "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt");
    array_add(*system_include_paths, "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.41.34120\\include");

    generate_bindings(opts, "module.jai");
}
