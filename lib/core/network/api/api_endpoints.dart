class ApiEndpoints {
  // Auth
  static const login = 'accounts/login/';
  static const register = 'accounts/register/';
  static const profile = 'accounts/me/';
  static const changePassword = 'accounts/change-password/';
  static const refreshToken = '/accounts/refresh/';

  // Projects
  static const projects = 'projects/';
  static const projectDetail = 'projects/{id}/';
  static const projectStats = 'projects/{id}/stats/';
  static const archiveProject = 'projects/{id}/archive/';
  static const unarchiveProject = 'projects/{id}/unarchive/';

  // Tasks
  static const tasks = 'tasks/';
  static const taskDetail = 'tasks/{id}/';
  static const completeTask = 'tasks/{id}/complete/';

  // Daily
  static const dailyToday = 'daily/today/';
  static const dailyOverdue = 'daily/overdue/';

  // Timer
  static const timerStart = 'timer/start/';
  static const timerStop = 'timer/{id}/stop/';
  static const timerHistory = 'timer/history/';

  // Income
  static const income = 'income/';
  static const incomeDetail = 'income/{id}/';

  // Notes
  static const notes = 'notes/';
  static const noteDetail = 'notes/{id}/';

  // Dashboard
  static const dashboard = 'dashboard/';
  static const recentActivity = 'dashboard/recent-activity/';
}
