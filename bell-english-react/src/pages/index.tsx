import React, { ClassicComponent, ComponentLifecycle, Component, JSXElementConstructor } from 'react';
import styles from './index.less';
import { mockCourse } from '@/mock/index'
import Check from '@/pages/componnets/check'
import DialogVideo from '@/pages/componnets/dialogVideo'
import Game from '@/pages/componnets/game'
import Image from '@/pages/componnets/image'
import Message from '@/pages/componnets/message'
import Tuwen from '@/pages/componnets/tuwen'
import VideoComponnet from '@/pages/componnets/video'
import Dialogue from '@/pages/componnets/dialogue'
import { EnumPageType, EnumMessageType } from '@/enum/index'
import { InterfacePage, InterfacePageProps } from '@/interface/index'
import { sendMessageToNative } from '@/utils/index'
import EventBus from '@/utils/event-bus.js'
interface Ref extends React.Component {
  deactivated(): void,
  actived(): void
}
interface ComponentItem {
  JSX: React.ReactElement<InterfacePageProps>,
  ref: React.RefObject<Ref>
}
interface stateInterface {
  activeIndex: number,
  ActiveComponent: React.ElementType,
  activePageData: InterfacePage,
  componentList: Array<ComponentItem | Function>
}

interface ComponentObject {
  [index: string]: React.ElementType
}
const componentObject: ComponentObject = {
  'check': Check,
  'dialogVideo': DialogVideo,
  'game': Game,
  'image': Image,
  'message': Message,
  'tuwen': Tuwen,
  'video': VideoComponnet,
  'dialogue': Dialogue
}
const defaultActiveIndex: number = 0
export default class App extends React.Component {
  state: stateInterface = {
    activeIndex: defaultActiveIndex,
    ActiveComponent: componentObject[mockCourse[defaultActiveIndex].type],
    activePageData: mockCourse[defaultActiveIndex],
    componentList: []
  }
  constructor(props: any) {
    super(props)
  }
  componentDidMount() {
    const componentList = mockCourse.map((page, index) => {
      const Component = componentObject[page.type]
      if (Component) {
        let ref = React.createRef()
        return {
          JSX: (<Component ref={ref} key={index} page={page} next={this.next.bind(this)} />),
          ref
        }
      } else { // 未找到对应的跳过
        switch (page.type) {
          case EnumPageType.phoneToTeacher:
            return () => {
              sendMessageToNative({
                type: EnumMessageType.phoneToTeacher,
                data: { }
              })
            }
          case EnumPageType.playTeacherVideo:
            return () => {
              sendMessageToNative({
                type: EnumMessageType.playTeacherVideo,
                data: {}
              })
              this.next()
            }
          case EnumPageType.phoneGameEnd:
            return () => {
              sendMessageToNative({
                type: EnumMessageType.phoneGameEnd,
                data: {}
              })
            }
          default:
            return this.next.bind(this)
        }
      }

    })
    this.setState({ componentList })
    EventBus.on('onNativeMessage', (message: any) => {
      switch (message.type) {
        case EnumMessageType.next:
          this.next()
      }
    })
    this.init()
  }
  init() {
    setTimeout(() => {
      if (this.state.componentList.length > 0) {
        const first = this.state.componentList[0]
        if (typeof first !== 'function') {
          first.ref.current && first.ref.current.actived && first.ref.current.actived()
        } else {
          first()
        }
      }
    })
  }
  next() {
    console.log('next')
    this.setState((state: stateInterface) => {
      // 暂停当前页面
      const currentItem = state.componentList[state.activeIndex]
      if (currentItem) {
        if (typeof currentItem != 'function') {
          if (state.activeIndex + 1 > 0) {
            if (currentItem.ref.current && currentItem.ref.current.deactivated) {
              currentItem.ref.current.deactivated()
            }
          }
          // 判断是否重复上一轮游戏
          if (currentItem.JSX.props.page.type === 'dialogue'
            && currentItem.JSX.props.page.bout === 1) {
            //重复进入游戏页面（返回到上一个页面）
            this.prev()
            return {}
          }
        }
      }
      const componentList = state.componentList
      if (this.state.activeIndex < mockCourse.length - 1) {
        let nextActiveIndex = state.activeIndex + 1
        const nextPage = state.componentList[nextActiveIndex]
        if (typeof nextPage === 'function') {
          nextPage()
        } else {
          if (nextPage) {
            sendMessageToNative({
              type: EnumMessageType.switchStatus,
              data: {
                status: nextPage.JSX.props.page.status,
              }
            })
            // 组件
            if (nextPage.JSX.props.page.type === 'dialogue') { // game结束后，将结果传更新到吓一跳对话页面
              if (!nextPage.JSX.props.page.bout) {
                nextPage.JSX.props.page.bout = 1 //第一回合的对话
                nextPage.JSX.props.page.isWin = false //第一回合的游戏结果
              } else {
                nextPage.JSX.props.page.bout++ // 第二回合的对话
                nextPage.JSX.props.page.isWin = false // 第二回合的游戏结果
              }
            }
            // 激活下一页面
            setTimeout(() => {
              if (nextPage.ref.current && nextPage.ref.current.actived) {
                nextPage.ref.current.actived()
              }
            })
            componentList[nextActiveIndex] = nextPage
          } else {
            return {}
          }
        }

        return { activeIndex: nextActiveIndex, componentList }
      } else {
        return { activeIndex: 0 }
      }
    })
  }
  prev() {
    this.setState((state: stateInterface) => {
      if (state.activeIndex > 0 && mockCourse.length > 0) {
        // 暂停当前页面
        const currentItem = state.componentList[state.activeIndex]
        if (currentItem) {
          if (state.activeIndex + 1 > 0) {
            if (typeof currentItem != 'function' && currentItem.ref.current && currentItem.ref.current.deactivated) {
              currentItem.ref.current.deactivated()
            }
          }
        }
        const prevActiveIndex = state.activeIndex - 1
        const prevPage = state.componentList[prevActiveIndex]
        if (typeof prevPage === 'function') {
          setTimeout(this.prev, 0)//可能有bug
          return { activeIndex: prevActiveIndex }
        } else {
          // 激活上一页面
          setTimeout(() => {
            if (prevPage.ref.current && prevPage.ref.current.actived) {
              prevPage.ref.current.actived()
            }
          })
        }
        return { activeIndex: prevActiveIndex }
      } else {
        return { activeIndex: 0 }
      }
    })
  }
  render() {
    const { activeIndex, componentList } = this.state
    const PageList = componentList.map((item, index, list) => {
      if (typeof item != 'function') {
        // if (index === activeIndex) {
        //   if (activeIndex > 0) {
        //     const prevItem = list[activeIndex - 1]
        //     if (typeof prevItem != 'function' && prevItem.ref.current && prevItem.ref.current.deactivated) {
        //       prevItem.ref.current.deactivated()
        //     }
        //   }
        //   setTimeout(() => {
        //     if (item.ref.current && item.ref.current.actived) {
        //       item.ref.current.actived()
        //     }
        //   })
        // }
        return (<div key={index} className={styles.page}
          style={{
            // zIndex: index === activeIndex ? list.length + 1 : list.length - index
            zIndex: index === activeIndex ? list.length + 1 : (index < activeIndex ? list.length : 0)
          }}> {item.JSX} </div>)
      }
      return item
    }).filter((item, index) => {
      const result = index + 2 >= activeIndex && index - 2 <= activeIndex // 显示activeIndex前后的2个,共5个
      return typeof item != 'function' && result
    })
    return (
      <div>
        <main className={styles.main}>
          {PageList}
        </main>
        <button style={{ position: 'absolute', bottom: 0, right: 0, zIndex: 999 }} onClick={this.next.bind(this)}>next</button>
      </div>
    )
  }
}