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
import { EnumPageType } from '@/enum/index'
import { InterfacePage, InterfacePageProps } from '@/interface/index'
interface Ref extends React.Component {
  deactivated(): void,
  actived(): void
}

interface stateInterface {
  activeIndex: number,
  ActiveComponent: React.ElementType,
  activePageData: InterfacePage,
  componentList: Array<{
    JSX: React.ReactElement<InterfacePageProps>,
    ref: React.RefObject<Ref>
  } | Function>
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
const defaultActiveIndex: number = 12
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
        // TODO
        const next = () => {
          setTimeout(this.next.bind(this), 1000)
        }
        switch (page.type) {
          case EnumPageType.phoneToTeacher:
            // TODO
            return next
          case EnumPageType.playTeacherVideo:
            // TODO
            return this.next.bind(this)
          case EnumPageType.phoneGameEnd:
            // TODO
            return next
          default:
            return this.next.bind(this)
        }
      }

    })
    this.setState({ componentList })
  }
  next() {
    this.setState((state: stateInterface) => {
      if (this.state.activeIndex < mockCourse.length - 1) {
        let activeIndex = state.activeIndex + 1
        const current = state.componentList[activeIndex]
        if (typeof current === 'function') {
          current()
        } else {
          // 组件
          if (current.JSX.props.page.type === 'dialogue') { // game结束后
            if (!current.JSX.props.page.bout) {
              current.JSX.props.page.bout = 1 //第一回合的对话
              current.JSX.props.page.isWin = true //第一回合的游戏结果
            } else {
              current.JSX.props.page.bout++ // 第二回合的对话
              current.JSX.props.page.isWin = false // 第二回合的游戏结果
            }

          }
        }
        return { activeIndex }
      } else {
        return { activeIndex: 0 }
      }
    })
  }

  render() {
    const { activeIndex, componentList } = this.state
    const PageList = componentList.map((item, index, list) => {
      if (typeof item != 'function') {
        if (index === activeIndex) {
          if (activeIndex > 0) {
            const prevItem = list[activeIndex - 1]
            if (typeof prevItem != 'function' && prevItem.ref.current && prevItem.ref.current.deactivated) {
              prevItem.ref.current.deactivated()
            }
          }
          setTimeout(() => {
            if (item.ref.current && item.ref.current.actived) {
              item.ref.current.actived()
            }
          })
        }
        return (<div key={index} className={styles.page}
          style={{
            // zIndex: index === activeIndex ? list.length + 1 : list.length - index
            zIndex: index === activeIndex ? list.length + 1 : (activeIndex > index ? index : 0)
          }}> {item.JSX} </div>)
      }
      return item
    }).filter(item => {
      return typeof item != 'function'
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