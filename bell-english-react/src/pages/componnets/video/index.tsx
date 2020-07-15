import React from 'react';
import styles from './index.less';
import { InterfacePageProps } from '@/interface/index'
import ClassVideoPage from '../ClassVideoPage'
import videoPoster from '@/assets/images/videoPoster.png'
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
      <video preload="load" controls poster={videoPoster} ref={this.ref} className={styles.video} onEnded={super.onended.bind(this)} src={page.url} />
    )
  }
}