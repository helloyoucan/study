import { InterfacePage } from '@/interface/index'

export const mockCourse: Array<InterfacePage> = [
  { // 标题页
    type: 'image',
    url: require('@/mock/static/001.jpg'),
    status: 1,
    stay: 3 // 停留时间
  },
  { // 引入动画
    type: 'video',
    url: require('@/mock/static/video/1.mp4').default,
    status: 1,
    autoSwitch: true//播放结束自动切换

  },
  { // 打电话给老师
    type: 'phone_to_teacher',
    url: '',
    status: 1
  },
  {
    type: 'play_teacher_video',
    status: 0,
    url: '',
  },
  /* 单词教学-start */
  {//视频
    type: 'video',
    tag: 'word',
    word: '',
    url: require('@/mock/static/video/2.mp4').default,
    status: 3,
  },
  {// 单词
    type: 'tuwen', // 静态页面
    tag: 'word',
    word: '',
    json: '',
    status: 3
  },
  {//自然拼读
    type: 'dialogVideo',// 浮窗视频
    tag: 'word',
    word: '',
    url: require('@/mock/static/video/2.mp4').default,
    status: 3
  },
  {//语音评测
    type: 'check',
    status: 1
  },
  /* 单词教学-end */
  { // 拓展
    type: 'video',
    url: require('@/mock/static/video/3.mp4').default,
    status: 3,
    autoSwitch: true//播放结束自动切换
  },
  {
    type: 'message',
    message: '前往胡同',
    status: 3,
    stay: 3 // 停留时间
  },
  { // 游戏转场
    type: 'video',
    status: 3,
    url: require('@/mock/static/video/1.mp4').default,
  },
  {
    type: 'game',
    status: 1,
    url: '',
  },
  {
    type: 'dialogue',
    status: 1
  },
  { // 打电话给老师
    type: 'phone_game_end',
    url: '',
    status: 1
  },
  {
    type: 'play_teacher_video',
    url: '',
    status: 0,
  },
  {
    type: 'tuwen', // 静态页面
    tag: 'review',
    status: 3,
    json: ''
  },
  {
    type: 'tuwen', // 静态页面
    tag: 'review',
    status: 3,
    json: ''

  },
  {
    type: 'tuwen', // 静态页面
    tag: 'review',
    status: 3,
    json: ''
  },
  {
    type: 'video',
    url: require('@/mock/static/video/4.mp4').default,
    status: 3,
    autoSwitch: true//播放结束自动切换
  }
]