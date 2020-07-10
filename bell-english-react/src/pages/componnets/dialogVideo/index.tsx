import React from 'react';
import styles from './index.less';
import { InterfacePageProps, ClassPage } from '@/interface/index'
import ClassVideoPage from '../ClassVideoPage'
interface Props extends InterfacePageProps { }
export default class DialogVideo extends ClassVideoPage {
  getVideoRef(): React.RefObject<HTMLVideoElement> {
    return this.ref
  }
  ref: React.RefObject<HTMLVideoElement> = React.createRef()
  render() {
    const { page } = this.props
    return (
      <div className={styles.dialog}>
        <div className={styles.dialogBody}>
          <div className={styles.border}></div>
          <video ref={this.ref} className={styles.video} onEnded={this.onended.bind(this)} src={page.url}></video>
        </div>
      </div>
    )
  }
}