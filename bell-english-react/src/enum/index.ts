export enum EnumPageType {
  phoneToTeacher = 'phone_to_teacher',
  playTeacherVideo = 'play_teacher_video',
  phoneGameEnd = 'phone_game_end'
}
export enum EnumMessageType {
  // h5 to android
  phoneToTeacher = 'phone_to_teacher',//老师打电话
  playTeacherVideo = 'play_teacher_video',//播放老师视频(单词,等场景)
  phoneGameEnd = 'game_end',// 游戏结束后的视频的交互
  switchStatus = 'switch_status',//切换布局
  checkStart = 'check_start',//开始检测单词
  // android to h5
  next = 'next',//下一环节
  checkSuccess = 'check_success',// 检测成功
  volume='volume', // 麦克风说话的音量
  // 共同
//   checkEnd = 'check_end',//检测结束
//   checkFail = 'check_end',//检测结束
}