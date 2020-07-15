import React from 'react';
import styles from './index.less';
import ClassPage from '../ClassPage'
import { InterfacePage } from '@/interface/index'
import EventBus from '@/utils/event-bus.js'
import { EnumMessageType } from '@/enum/index'
import { sendMessageToNative } from '@/utils/index'
import Reward from '@/pages/componnets/reward/main.ts'
interface Props {
  page: InterfacePage,
  next: Function
}

interface State {
  timeId: number | undefined,
  progress: number,
  volume: number
}
const CheckTime = 8 // 评测秒数
export default class Check extends React.Component<Props, {}> implements ClassPage {
  state: State = {
    timeId: undefined,
    progress: 1,
    volume: 0//音量
  }
  componentWillUnmount() {
    this.state.timeId && clearInterval(this.state.timeId)
  }
  actived(): void {
    const timeId = setInterval(() => {
      if (this.state.progress <= 0) {
        timeId && clearInterval(timeId)
      } else {
        this.setState((state: State) => {
          return {
            progress: state.progress - (1 / CheckTime / 100),
            // volume: state.volume % 2 === 1 ? state.volume - 1 : state.volume + 1
          }
        })
      }
    }, 10)
    this.setState({
      timeId
    })
    sendMessageToNative({
      type: EnumMessageType.checkStart,
      data: {
        word: this.props.page.word,
        status: this.props.page.status,
      }
    })
    EventBus.on('onNativeMessage_check', (message: any) => {
      console.log('onNativeMessage_check:', message)
      switch (message.type) {
        case EnumMessageType.checkSuccess:
          this.stop()
          let grade = parseInt(message.data.value, 10)
          if(grade>=0&&grade<=1){
            grade=1
          }
          if(grade>=2&&grade<=3){
            grade=3
          }
          if(grade>=4&&grade<=5){
            grade=3
          }
          console.log('grade'+grade)
          Reward
            .open({ grade })
            .then(() => { })
            .catch(console.log)
            .finally(() => {
              this.props.next()
            })
          break
        case EnumMessageType.volume:
          this.setState({ volume: parseInt(message.data.volume, 10) })
          break

      }
    })
  }
  deactivated(): void {
    EventBus.off('onNativeMessage_check')
    this.state.timeId && clearInterval(this.state.timeId)
    this.setState({ progress: 2 })
  }
  stop() {
    this.state.timeId && clearInterval(this.state.timeId)
  }
  render() {
    const { progress, volume } = this.state
    const { page } = this.props
    return (
      <div className={styles.check} style={{ backgroundImage: `url(${page.url})` }}>
        <div className={styles.checkProgress}>
          <div className={styles.progressTrack}>
            <div className={styles.progress} style={{ transform: `scaleX(${progress})` }}></div>
            <span style={{ transform: `scale(${volume / 3 + 1})` }} className={styles.mi}></span>
          </div>
        </div>
      </div>
    )
  }
}