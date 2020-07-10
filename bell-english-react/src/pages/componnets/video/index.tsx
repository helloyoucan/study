import React from 'react';
import styles from './index.less';
import { InterfacePageProps } from '@/interface/index'
import ClassVideoPage from '../ClassVideoPage'
interface Props extends InterfacePageProps { }
export default class Video extends ClassVideoPage {
  getVideoRef(): React.RefObject<HTMLVideoElement> {
   return this.ref
  }
  // defaultProps={}
  ref: React.RefObject<HTMLVideoElement> = React.createRef()
  render() {
    const { page } = this.props
    return (
      <video ref={this.ref} className={styles.video} onEnded={super.onended.bind(this)} src={page.url} />
    )
  }
}