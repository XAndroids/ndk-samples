#
# Copyright (C) 2016 The Android Open Source Project
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

#定义LOCAL_PATH变量，用于在开发树中查找源文件，宏函数my-dir由编译系统提供，用于返回当前路径
LOCAL_PATH := $(call my-dir)

include $(LOCAL_PATH)/../../common.mk

JNI_SRC_PATH := $(SAMPLES_ROOT)/hello-jni/app/src/main/cpp

#CLEAR_VARS由编译系统提供，让GNU MAKEFILE为你清除许多LOCAL_XXX变量。因为所有编译控制文件都在同一GUN MAKE环境中
#执行，所有变量都是全局的
include $(CLEAR_VARS)

#LOCAL_MODULE必须定义，描述每个模块，名称唯一，不高寒空格，编译系统自动产生合适的前缀和后缀
LOCAL_MODULE    := hello-jni
#LOCAL_SRC_FILES包含将要编译打包进模块的C或C++源代码文件，直接传递给编译器的源代码文件就好
LOCAL_SRC_FILES := $(JNI_SRC_PATH)/hello-jni.c

include $(BUILD_SHARED_LIBRARY)
