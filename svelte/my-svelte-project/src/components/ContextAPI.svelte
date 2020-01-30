
<script>
import { getContext, setContext } from 'svelte';

setContext('contextKey', {
	key: 'context api'
});
// 在组件及其子孙组件使用
const { key } = getContext('contextKey');
console.log(key)
</script>

<h2>访问上下文的API-setContext和getContext</h2>
<p>类似vue的inject/provide</p>
<h3>context api 与store类似，但是store应用于整个程序，content api适用于组件及其子孙后代</h3>
<p>两者的使用场景：一个组件有多个实例，不同实例之间互不影响</p>
<pre>
{'const { these, are, stores } = getContext(...);'}
</pre>