import React from 'react';
import { InterfacePage } from '@/interface/index'
import ClassPage from './ClassPage'
interface Props {
    page: InterfacePage,
    next: Function
  }

export default class ClassStaticPage extends React.Component<Props> implements ClassPage{
    state = {
        timeId: undefined
    }
    componentWillUnmount() {
        this.state.timeId && clearTimeout(this.state.timeId)
    }
    actived() {
        if (this.props.page.stay) {
            const timeId = setTimeout(() => {
                this.props.next()
                // this.setState({ timeId: undefined })
            }, this.props.page.stay * 1000)
            this.setState({ timeId })
        }
    }
    deactivated() {
        this.state.timeId && clearTimeout(this.state.timeId)
    }
}