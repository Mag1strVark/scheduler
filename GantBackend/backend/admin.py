from django.contrib import admin
from .models import *


@admin.register(Role)
class RoleAdmin(admin.ModelAdmin):
    list_display = ('name', )


@admin.register(Status)
class StatusAdmin(admin.ModelAdmin):
    list_display = ('name', )


@admin.register(Task)
class TaskAdmin(admin.ModelAdmin):
    list_display = ('id', 'parent_id', 'name', 'description', 'is_completed', )


@admin.register(Executor)
class ExecutorAdmin(admin.ModelAdmin):
    list_display = ('task_id', 'user_id', )


@admin.register(Stage)
class TaskStageAdmin(admin.ModelAdmin):
    list_display = ('task_id', 'description', 'is_ready')


@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ('task_id', 'user_id', 'content')


