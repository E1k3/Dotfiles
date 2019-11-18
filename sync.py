#!/usr/bin/env python3

import os


def user_confirm(prompt: str = ''):
    answer: str = input(prompt)
    if answer in ["y", "ye", "yes"]:
        return True
    if answer in ["n", "no"]:
        return False
    return user_confirm()


def files_in_dir(path: str):
    pass


if __name__ == "__main__":
    directory: str = "files"
    for paths, subdirs, files in os.walk(directory):
        print(f"Paths: {paths}, Subdirs: {subdirs}, Files: {files}")
        print()
