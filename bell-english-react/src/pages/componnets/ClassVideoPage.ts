import React from 'react';
import { InterfacePage } from '@/interface/index'
import ClassPage from './ClassPage'
interface Props {
    page: InterfacePage,
    next: Function
}

export default abstract class ClassVideoPage extends React.Component<Props> implements ClassPage {
    abstract getVideoRef(): React.RefObject<HTMLVideoElement>
    deactivated(): void {
        const _ref = this.getVideoRef()
        if (_ref.current && _ref.current.pause&&_ref.current.paused) {
            _ref.current.pause()
            _ref.current.currentTime = 0
        }
    }
    actived() {
        const _ref = this.getVideoRef()
        if (_ref.current && _ref.current.play) {
            _ref.current.play()
        }
    }
    onended() {
        const { page, next } = this.props
        if (page.autoSwitch) {
            next()
        }
    }

}