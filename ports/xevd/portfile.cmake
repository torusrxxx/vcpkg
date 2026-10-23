vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mpeg5/xevd
    REF "v${VERSION}"
    SHA512 2cf5dbc7bd52c045d4cb1627385ffb48010995574001ea5f3b5fcfc3babc9b41da56f327beca1ef9fd50c9546fb1a407e8a3abdb38dd1dcd45311b841af0b524
    HEAD_REF master
)

if("main-profile" IN_LIST FEATURES)
    set(SET_PROF MAIN)
else()
    set(SET_PROF BASE)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        "-DSET_PROF=${SET_PROF}"
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
