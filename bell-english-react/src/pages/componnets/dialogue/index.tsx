/**
 * 游戏结束后的对话
 */
import React from 'react';
import styles from './index.less';
import { InterfacePageProps } from '@/interface/index'
import ClassPage from '../ClassPage'
const bufu = require('./assets/bufu.png')
const deyi = require('./assets/deyi.png')
const fuqi = require('./assets/fuqi.png')
const kaixin = require('./assets/kaixin.png')
const DemoLose1 = require('./assets/media/1.DemoLose.mp3').default
const DemoWin1 = require('./assets/media/1.DemonWin.mp3').default
const DemoLose2 = require('./assets/media/2.DemoLose.mp3').default
const DemoWin2 = require('./assets/media/2.DemonWin.mp3').default
interface Props extends InterfacePageProps {
}
interface State {
  timeId: undefined | number,
  showBiaoQingCount: number,
  isPlayd: boolean
}

export default class Dialogue extends React.Component<Props> implements ClassPage {
  state: State = {
    timeId: undefined,
    showBiaoQingCount: 0,
    isPlayd: false
  }
  componentDidMount() {
    this.state.timeId && clearTimeout(this.state.timeId)
  }
  actived(): void {
    const addBiaoQingCount = () => {
      const timeId = setTimeout(() => {
        this.setState((state: State) => ({
          showBiaoQingCount: state.showBiaoQingCount + 1
        }), () => {
          if (this.state.showBiaoQingCount >= 3) {
            //对话完毕
            if (this.props.page.bout && this.props.page.bout > 1) {
              // TODO
              // 是否自动切换？
            }
          } else {
            addBiaoQingCount()
          }
        })
      }, 500)
      this.setState({ timeId })
    }
    addBiaoQingCount()
    setTimeout(() => {
      const Audio: (HTMLAudioElement | null) = document.querySelector('.' + styles.audio)
      if (Audio && Audio.paused) {
        Audio.readyState === 4 && Audio.play()
        this.setState({ isPlayd: true })
      }
    })
  }
  deactivated(): void {
    this.state.timeId && clearTimeout(this.state.timeId)
    this.setState({
      showBiaoQingCount: 0,
      isPlayd: false
    })
    const Audio: (HTMLAudioElement | null) = document.querySelector('.' + styles.audio)
    if (Audio && !Audio.paused) {
      Audio.pause()
      Audio.currentTime = 0
      Audio.src = ''
    }
  }
  onClick() {
    this.props.next && this.props.next()
  }
  onended() {
    const { page, next } = this.props
    // if (page.autoSwitch) {
    setTimeout(() => {
      // 需求不明确，待定
      // next()
    }, 1000)
    // }
  }
  ref: React.RefObject < HTMLVideoElement > = React.createRef()
  render() {
    const { bout, isWin } = this.props.page
    const { showBiaoQingCount, isPlayd } = this.state
    let biaoQing: string = ''
    let audio: string = ''
    if (bout === 1) {//回合1
      if (isWin) {//学生赢了
        biaoQing = bufu
        audio = DemoLose1
      } else {
        biaoQing = deyi
        audio = DemoWin1
      }

    } else { //回合2
      if (isWin) {//学生赢了
        biaoQing = fuqi
        audio = DemoLose2
      } else {
        biaoQing = kaixin
        audio = DemoWin2
      }
    }
    
    return (
      <div className={styles.dialogue}>
        <div className={styles.dialogueBody}>
          <div className={styles.Demon}>
            {new Array(showBiaoQingCount > 3 ? 3 : showBiaoQingCount).fill(0).map((_, index) => (<img key={index} className={styles.biaoQing} src={biaoQing} />))}
            <audio ref={this.ref} onEnded={this.onended.bind(this)} autoPlay={isPlayd} className={styles.audio} src={audio} />
          </div>
        </div>
      </div>
    )
  }
}