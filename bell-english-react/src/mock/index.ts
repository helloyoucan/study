import { InterfacePage } from '@/interface/index'

export const mockCourse: Array<InterfacePage> = [
  { // 标题页
    type: 'image',
    url: require('@/mock/static/p1/1.jpg'),
    status: 1,
    stay: 3, // 停留时间
    hasBgColor: true
  },
  { // 引入动画
    type: 'video',
    url: require('@/mock/static/p2/1.mp4').default,
    status: 1,
    autoSwitch: true//播放结束自动切换
  },
  { // 打电话给老师
    type: 'phone_to_teacher',
    url: '',
    status: 0
  },
  // {
  //   type: 'play_teacher_video',
  //   status: 2,
  //   url: require('@/mock/static/p3/1.mp4').default
  // },
  /* 单词教学-start */
  //China
  {
    type: 'image', // 静态页面
    tag: 'word',
    word: 'China',
    status: 2,
    url: require('@/mock/static/p3/1.jpg'),
    hasBgColor: true
  },
  {
    type: 'image', // 静态页面
    tag: 'word',
    word: 'China',
    status: 2,
    url: require('@/mock/static/p4/1.jpg'),
    hasBgColor: true
  },
  {//自然拼读
    type: 'dialogVideo',// 浮窗视频
    tag: 'word',
    word: 'China',
    url: require('@/mock/static/p5/China.mp4').default,
    status: 2
  },
  {//语音评测
    type: 'check',
    tag: 'word',
    word: 'China',
    url: require('@/mock/static/p6/1.png'),
    status: 1
  },
  // Chinese
  {
    type: 'image',
    tag: 'word',
    word: 'Chinese',
    status: 2,
    url: require('@/mock/static/p7/1.png'),
    hasBgColor: true
  },
  {
    type: 'image',
    tag: 'word',
    word: 'Chinese',
    status: 2,
    url: require('@/mock/static/p7/2.png'),
    hasBgColor: true
  },
  {
    type: 'image',
    tag: 'word',
    word: 'Chinese',
    status: 2,
    url: require('@/mock/static/p8/1.png'),
    hasBgColor: true
  },
  {//自然拼读
    type: 'dialogVideo',// 浮窗视频
    tag: 'word',
    word: 'Chinese',
    url: require('@/mock/static/p9/Chinese.mp4').default,
    status: 2
  },
  {//语音评测
    type: 'check',
    tag: 'word',
    word: 'Chinese',
    url: require('@/mock/static/p10/1.png'),
    status: 1
  },
  // Beijing
  {
    type: 'image',
    tag: 'word',
    word: 'Beijing',
    status: 2,
    url: require('@/mock/static/p11/1.png'),
    hasBgColor: true
  },
  {
    type: 'image',
    tag: 'word',
    word: 'Beijing',
    status: 2,
    url: require('@/mock/static/p11/2.png'),
    hasBgColor: true
  },
  {
    type: 'image',
    tag: 'word',
    word: 'Beijing',
    status: 2,
    url: require('@/mock/static/p12/1.jpg'),
    hasBgColor: true
  },
  {//自然拼读
    type: 'dialogVideo',// 浮窗视频
    tag: 'word',
    word: 'BeiJing',
    url: require('@/mock/static/p13/BeiJing.mp4').default,
    status: 2
  },
  {//语音评测
    type: 'check',
    tag: 'word',
    word: 'Beijing',
    url: require('@/mock/static/p14/1.png'),
    status: 1
  },
  /* 单词教学-end */
  { // 拓展
    type: 'video',
    url: require('@/mock/static/p15/1.mp4').default,
    status: 2,
    autoSwitch: true//播放结束自动切换
  },
  { // 游戏转场
    type: 'video',
    status: 2,
    url: require('@/mock/static/p16/1.mp4').default,
  },
  {
    type: 'message',
    message: '前往胡同',
    status: 2
  },
  {
    type: 'image',
    status: 2,
    url: require('@/mock/static/p17/1.png'),
    hasBgColor: true
  },
  {
    type: 'image',
    status: 2,
    url: require('@/mock/static/p17/2.png'),
    hasBgColor: true
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
  {
    type: 'game',
    status: 1,
    url: '',
  },
  {
    type: 'dialogue',
    status: 1
  },
  { // 游戏转场
    type: 'video',
    status: 2,
    url: require('@/mock/static/p23/1.mp4').default,
  },
  {
    type: 'image',
    status: 2,
    url: require('@/mock/static/p24/1.jpg'),
    hasBgColor: true
  },
  {
    type: 'image',
    status: 2,
    url: require('@/mock/static/p25/1.png'),
    hasBgColor: true
  },
  {
    type: 'image',
    status: 2,
    url: require('@/mock/static/p26/1.jpg'),
    hasBgColor: true
  },
  // { // 打电话给老师
  //   type: 'phone_game_end',
  //   url: '',
  //   status: 1
  // },
  {
    type: 'play_teacher_video',
    url: '',
    status: 0,
  },
  {
    type: 'video',
    url: require('@/mock/static/p27-p28/1.mp4').default,
    status: 0,
    autoSwitch: true
  },
  {
    type: 'image',
    status: 2,
    url: require('@/mock/static/p27-p28/1.gif'),
    hasBgColor: false
  },
  // {
  //   type: 'tuwen', // 静态页面
  //   tag: 'review',
  //   status: 2,
  //   json: ''
  // },
  // {
  //   type: 'tuwen', // 静态页面
  //   tag: 'review',
  //   status: 2,
  //   json: ''

  // },
  // {
  //   type: 'tuwen', // 静态页面
  //   tag: 'review',
  //   status: 2,
  //   json: ''
  // },
]