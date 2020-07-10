/**
 * 游戏结束后的对话
 */
import React from 'react';
import styles from './index.less';
import { InterfacePageProps } from '@/interface/index'
import ClassPage from '../ClassPage'
import bufuImg from './assets/bufu.png'
import deyiImg from './assets/deyi.png'
import fuqiImg from './assets/fuqi.png'
import kaixinImg from './assets/kaixin.png'
interface Props extends InterfacePageProps {
}
interface State {
  isSwitchDialogue: boolean,
  timeId: undefined | number,
  showBiaoQingCount: number
}
export default class Dialogue extends React.Component<Props> implements ClassPage {
  state: State = {
    isSwitchDialogue: false,
    timeId: undefined,
    showBiaoQingCount: 0
  }
  actived(): void {
    const addBiaoQingCount = () => {
      setTimeout(() => {
        this.setState((state: State) => ({
          showBiaoQingCount: state.showBiaoQingCount + 1
        }), () => {
          if (this.state.showBiaoQingCount >= 3) {
            if (!this.state.isSwitchDialogue) {
              setTimeout(() => {
                this.setState({
                  isSwitchDialogue: true,
                  showBiaoQingCount: 0
                }, addBiaoQingCount)
              }, 1000)
            } else {//对话完毕
              if (this.props.page.bout && this.props.page.bout > 1) {
                // TODO
                // 是否自动切换？
              }
            }
          } else {
            addBiaoQingCount()
          }
        })
      }, 500)
    }
    addBiaoQingCount()
  }
  deactivated(): void {
    this.setState({
      isSwitchDialogue: false,
      showBiaoQingCount: 0
    })
  }
  onClick() {
    this.props.next && this.props.next()
  }
  render() {
    const { bout, isWin } = this.props.page
    const { isSwitchDialogue, showBiaoQingCount } = this.state
    let Lose = null
    let Win = null
    if (bout === 1) {//回合1
      Lose = new Array(showBiaoQingCount).fill(0).map((_, index) => (
        <React.Fragment key={index}>
          <img className={styles.biaoQing} src={bufuImg} />
          <audio></audio>
        </React.Fragment>
      ))
      Win = new Array(showBiaoQingCount).fill(0).map((_, index) => (
        <React.Fragment key={index}>
          <img className={styles.biaoQing} src={deyiImg} />
          <audio></audio>
        </React.Fragment>

      ))
    } else { //回合2
      Lose = new Array(showBiaoQingCount).fill(0).map((_, index) => (
        <React.Fragment key={index}>
          <img className={styles.biaoQing} src={fuqiImg} />
          <audio></audio>
        </React.Fragment>

      ))
      Win = new Array(showBiaoQingCount).fill(0).map((_, index) => (
        <React.Fragment key={index}>
          <img className={styles.biaoQing} src={kaixinImg} />
          <audio></audio>
        </React.Fragment>

      ))
    }
    let DialogueBody = null
    if (isWin) {
      DialogueBody = !isSwitchDialogue
        ? (<div className={styles.Yami}>{Win}</div>)
        : <div className={styles.Demon}>{Lose}</div>
    } else {
      DialogueBody = !isSwitchDialogue
        ? (<div className={styles.Yami}>{Lose}</div>)
        : <div className={styles.Demon}>{Win}</div>
    }
    return (
      <div className={styles.dialogue}>
        <div className={styles.dialogueBody}>{DialogueBody} </div>
      </div>
    )
  }
}