export interface InterfacePage {
  type: string;
  url?: any;
  status: number;
  tag?: string;
  word?: string;
  breakpointTime?: number | string;
  json?: any;
  message?: string;
  stay?:number,
  autoSwitch?:boolean,
  bout?:number,
  isWin?:boolean
}
export interface InterfacePageProps{
  page:InterfacePage,
  next:Function
}
export interface ClassPage{
  actived():void //激活页面播放
  deactivated():void //停用时调用
}