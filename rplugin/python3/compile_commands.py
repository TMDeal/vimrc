from pathlib import Path
import neovim
import json
import re

@neovim.plugin
class CompileCommands:
    def __init__(self, vim):
        self.vim = vim

    @neovim.function('CompileCommandsParse', sync=True)
    def CompileCommandsParse(self, args):
        includeRe = r'-I[^\s]+'
        sysIncludeRe = r'-isystem [^\s]+'
        flagRe = r' (-[^I|i][^\s]+)'

        includeReDir = r'-I([^\s]+)'
        sysIncludeReDir = r'-isystem ([^\s]+)'

        if not Path(args[0]).is_file():
            return {
                "all": [],
                "dirs": []
            }

        with open(args[0]) as f:
            data = json.load(f)

        includes = []
        sysIncludes = []
        flags = []
        dirs = []

        for d in data:
            command = d["command"]

            for include in re.findall(includeRe, command):
                if include not in includes:
                    includes.append(include)

            for sysInclude in re.findall(sysIncludeRe, command):
                if sysInclude not in sysIncludes:
                    sysIncludes.append(sysInclude)

            for flag in re.findall(flagRe, command):
                if flag not in flags:
                    flags.append(flag)

            for dir in re.findall(sysIncludeReDir, command):
                if dir not in dirs:
                    dirs.append(dir)

            for dir in re.findall(includeReDir, command):
                if dir not in dirs:
                    dirs.append(dir)

        return {
            'all': flags + includes + sysIncludes,
            'dirs': dirs
        }
