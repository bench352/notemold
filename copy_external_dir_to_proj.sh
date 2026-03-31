#!/bin/bash

# A simple script to copy external directory containing skills
# folder to project's and global .agent/skills folder. A workaround for
# doing the prompt engineering with Obsidian (on PC/Android phone)
# while testing it with WSL/Termux Proot Distro.

rm -r $(pwd)/.agents/skills/notemold
rm -r $HOME/.agents/skills/notemold
. .env
cp -R "$DRAFT_SKILL_SPEC_PATH" $(pwd)/.agents/skills
cp -R "$DRAFT_SKILL_SPEC_PATH" $HOME/.agents/skills
echo "Copied '$DRAFT_SKILL_SPEC_PATH' to '$(pwd)/.agents/skills' and '$HOME/.agents/skills'"