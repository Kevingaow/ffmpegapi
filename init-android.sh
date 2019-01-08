#! /bin/bash
#
# Copyright (C) 2019 Smartisan
# Copyright (C) 2019 ChenChunsheng <chenchunsheng@smartisan.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FFMPEG_FORK=https://git.ffmpeg.org/ffmpeg.git
#FFMPEG_FORK=git@github.com:badwtg1111/FFmpeg-1.git
FFMPEG_TAG=n3.4
FFMPEG_LOCAL_REPO=ffmpeg

set -e
git --version

echo "== pull ffmpeg base =="
sh tools/pull-repo-base.sh $FFMPEG_FORK $FFMPEG_LOCAL_REPO
cd $FFMPEG_LOCAL_REPO
#git checkout ffmpegdev
git checkout ${FFMPEG_TAG} -B ffmegapi
cd -

function pull_fork() {
    echo "== pull ffmpeg fork $1 =="
    sh tools/pull-repo-ref.sh $FFMPEG_FORK ffmpeg-$1 ${FFMPEG_LOCAL_REPO}
    cd ffmpeg-$1
    git checkout ${FFMPEG_TAG} -B ffmegapi
    cd -
}

FFMPEG_ARCHS="armv5 armv7a arm64 x86 x86_64"

#for arch in $FFMPEG_ARCHS
#do
    #mkdir -p ffmpeg-$arch
#done

#pull_fork "armv5"
#pull_fork "armv7a"
#pull_fork "arm64"
#pull_fork "x86"
#pull_fork "x86_64"

./tools/init-config.sh
